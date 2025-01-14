import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/views/cart/Cart.dart';
import 'package:flutter_ecommerce/views/home/Home.dart';
import 'package:flutter_ecommerce/views/profile/UserProfile.dart';

class PageNavigator extends StatefulWidget {
  @override
  _PageNavigatorState createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      HomePage(title: "Cakes"),
      CartPage(title: "Cart"),
      ProfilePage(title: "Profile"),
    ];

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (value) {
          print("Which index is tapped: $value");
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.shopping_cart,
              size: 30,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
