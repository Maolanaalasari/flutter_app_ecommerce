import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/cart_models.dart';
import 'package:flutter_ecommerce/views/cart/Component.dart';

class CartPage extends StatefulWidget {
  CartPage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _paymentBtn(),
        backgroundColor: Colors.grey.shade200,
        body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              applySpacer(),
              buildCartActionbar(
                context,
                "Shopping",
                "Cart has ${getCartModel().length} Items",
              ),
              applySpacer(),
              Expanded(
                child: ListView.builder(
                    itemCount: getCartModel().length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: buildCartCard(index),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  FloatingActionButton _paymentBtn() {
    return FloatingActionButton.extended(
      label: Text("INR ${_calTotalPrice()}"),
      icon: Icon(CupertinoIcons.shopping_cart),
      backgroundColor: Colors.green.shade400,
      foregroundColor: Colors.white,
      tooltip: 'Checkout',
      onPressed: () => {print('Go for the payment')},
    );
  }

  double _calTotalPrice() {
    List<CartModel> items = getCartModel();
    double totalPrice = 0;
    for (var item in items) {
      totalPrice = totalPrice + item.price;
    }
    return totalPrice;
  }
}
