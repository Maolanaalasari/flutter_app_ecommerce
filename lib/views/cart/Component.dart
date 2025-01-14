import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/cart_models.dart';

SizedBox applySpacer() {
  return SizedBox(
    height: 20,
  );
}

TextStyle textStylebold() {
  return TextStyle(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold);
}

buildCartActionbar(
    BuildContext context, String stringTitle, String stringSubTitle) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: RichText(
                text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: stringTitle,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 25)),
                TextSpan(
                    text: '\n$stringSubTitle',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ],
            )),
          ),
          CircleAvatar(
            child: Icon(CupertinoIcons.delete),
          )
        ],
      ));
}

Card buildCartCard(int index) {
  return Card(
    elevation: 2,
    child: Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _imageIcon(index),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _cardTitle(index),
                      _applySpacer(),
                      _cardQNTY(index),
                      SizedBox(
                        height: 10,
                      ),
                      _cartPrice(index),
                      _applySpacer(),
                      _rowRemoveEditWidget()
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Image _imageIcon(int index) {
  return Image.network(
    getCartModel()[index].icon,
    //color: Colors.grey.shade200,
    fit: BoxFit.cover,
    height: 150,
    width: 100,
    alignment: Alignment.center,
  );
}

Row _rowRemoveEditWidget() {
  return Row(
    children: [
      CircleAvatar(
        child: Center(child: Icon(Icons.add)),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          '1',
          style: TextStyle(fontSize: 20),
        ),
      ),
      CircleAvatar(
        child: Center(child: Icon(Icons.remove)),
      ),
    ],
  );
}

Text _cartPrice(int index) {
  return Text(
    "INR: ${getCartModel()[index].price}",
    style: textStylebold(),
  );
}

Text _cardQNTY(int index) {
  return Text(
    "QTY: ${getCartModel()[index].qty}",
    style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
  );
}

Text _cardTitle(int index) {
  return Text(
    getCartModel()[index].title,
    overflow: TextOverflow.ellipsis,
    maxLines: 3,
    softWrap: true,
    style: textStylebold(),
  );
}

SizedBox _applySpacer() {
  return SizedBox(
    height: 10,
  );
}
