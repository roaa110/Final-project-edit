
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/home/home.dart';
//import 'package:flutter_application_1/home/home.dart';
//import 'package:flutter_application_1/splash_screen.dart';
//import 'package:flutter_application_1/home/home.dart';
//import 'package:flutter_application_1/welcome.dart';
//import 'package:flutter_application_1/splash_screen.dart';
//import 'package:flutter_application_1/login.dart';
//import 'package:flutter_application_1/splash_screen.dart';
//import'package:flutter_application_1/classes/navigation.dart';
//import 'package:flutter_application_1/home/home2.dart';
//import 'package:flutter_application_1/food/food_screen.dart';
//import 'package:flutter_application_1/profile_user.dart';
//import'package:flutter_application_1/location/locationuser.dart';
// import 'package:flutter_application_1/Popular items/all_products.dart';
//import 'package:flutter_application_1/search_page.dart';
//import 'package:flutter_application_1/Popular items/popular_page.dart';
import 'package:flutter_application_1/Popular items/chef_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChefPage(name: 'Rana Aloran',
        rating: 4.1,
        description: 'Specialist passionate about crafting authentic Eastern dishes and delightful desserts, made with care, quality, and a true homemade touch.',
        topDishes: [
          {
            'name': 'Kibbeh',
            'ingredients': 'Bulgur wheat, Minced meat, Onions & Toasted nuts',
            'price': 1.50,
            'image': 'assets/images/kibbeh.png',
          },
          {
            'name': 'Fattoush',
            'ingredients': 'Lettuce, tomato, cucumber, radish, bread',
            'price': 2.0,
            'image': 'assets/images/fattoush.png',
          },
          {
            'name': 'Lemon Cake',
            'ingredients': 'Flour, sugar, eggs, milk, baking powder, lemon',
            'price': 5.0,
            'image': 'assets/images/lemon_cake.png',
          },
        ],
       
      ),
    );
  }
}