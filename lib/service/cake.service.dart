import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/cakes.dart';

class CakeService {
  List<Cakes> cakeList = [];
  String description =
      "Cake is a form of sweet food made from flour, sugar, and other ingredients, that is usually baked. ... The most commonly used cake ingredients include flour, sugar, eggs, butter or oil or margarine, a liquid, and leavening agents, such as baking soda or baking powder";

  List<String> get cakeCategories => [
        'Classic Vanila',
        'Irish Coffee',
        'Coffee Mocha',
        'Genoise Cake',
        'Litchee',
        'Choco Express',
        'Choco Walnut',
        'Choco Cream',
        'Rocky Almond',
        'Red Cherry',
        'Fruit Of Forest',
        'Cosmo Mango',
        'Red Velvet'
      ];
}

void showSnackBar(BuildContext context, String stringToPrint) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(stringToPrint)));
}
