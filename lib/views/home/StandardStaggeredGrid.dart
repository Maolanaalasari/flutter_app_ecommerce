import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/album.dart';
import 'package:flutter_ecommerce/views/details/ProductDetail.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StandardStaggeredGrid extends StatefulWidget {
  const StandardStaggeredGrid({Key? key, required this.albums})
      : super(key: key);

  final List<Album> albums;

  @override
  _StandardStaggeredGridState createState() => _StandardStaggeredGridState();
}

class _StandardStaggeredGridState extends State<StandardStaggeredGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        itemCount: widget.albums.length,
        itemBuilder: (context, index) => ImageCard(
          album: widget.albums[index],
        ),
        staggeredTileBuilder: (index) => const StaggeredTile.count(1, 1),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}

class InstagramSearchGrid extends StatelessWidget {
  const InstagramSearchGrid({Key? key, required this.albums}) : super(key: key);

  final List<Album> albums;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: albums.length,
      itemBuilder: (context, index) => ImageCard(
        album: albums[index],
      ),
      staggeredTileBuilder: (index) => StaggeredTile.count(
        (index % 7 == 0) ? 2 : 1,
        (index % 7 == 0) ? 2 : 1,
      ),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}

class PinterestGrid extends StatelessWidget {
  const PinterestGrid({Key? key, required this.albums}) : super(key: key);

  final List<Album> albums;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: albums.length,
      itemBuilder: (context, index) => ImageCard(
        album: albums[index],
      ),
      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetail(
                album: album,
              ),
            ),
          );
        },
        child: Image.network(album.photos.large2x, fit: BoxFit.cover),
      ),
    );
  }
}
