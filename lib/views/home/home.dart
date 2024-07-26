import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/album.dart';
import 'package:flutter_ecommerce/service/cake.service.dart';
import 'package:flutter_ecommerce/views/home/Component.dart';
import 'package:flutter_ecommerce/views/home/StandardStaggeredGrid.dart';

class HomePage extends StatefulWidget {
  HomePage({required Key key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Album> listOfAlbums = [];
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    var fetch = fetchAlbums(40);
    fetch.then((response) {
      setState(() {
        listOfAlbums = response;
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      // ignore: invalid_return_type_for_catch_error
      return Center(
        child: Text(
          "We are facing internal issue: ${error.toString()}",
          style: TextStyle(
              color: Colors.red.shade300,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      floatingActionButton: buildHomeFloatingBtn(listOfAlbums, context),

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              applySpacer(),
              buildHomeActionbar(
                context,
                "Our",
                "Products",
              ),
              //Provide vertical Space
              applySpacer(),

              CupertinoTextField(
                placeholder: "or, type what you're looking",
              ),

              applySpacer(),

              //Horizontal listview for categories
              Container(
                height: 40,
                child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: CakeService().cakeCategories.length,
                  itemBuilder: (context, index) {
                    return buildCakeCategory(index);
                  },
                ),
              ),

              applySpacer(),
              //Create ListView/GridView For The Cakes
              //That contains all the available spaces

              Container(
                  child: isLoading
                      ? CircularProgressIndicator(
                          strokeWidth: 3,
                          backgroundColor: Colors.deepPurple,
                        )
                      : Expanded(
                          child: InstagramSearchGrid(
                            albums: listOfAlbums,
                          ),
                        )), //buildGridView(orientation, listOfAlbums)
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
