import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/views/navigator/navigator.dart';
import 'package:google_fonts/google_fonts.dart';

class CakeApplication extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0,
          systemOverlayStyle:
              SystemUiOverlayStyle.light, // Updated for brightness
        ),
        brightness: Brightness.light,
        textTheme: GoogleFonts.sansitaTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(secondary: Colors.green.shade900),
      ),
      home: PageNavigator(),
    );
  }
}
