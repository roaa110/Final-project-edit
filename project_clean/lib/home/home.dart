import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/colors.dart';
import 'package:flutter_application_1/welcome.dart';
import 'package:flutter_application_1/classes/categorybutton.dart';
import 'package:flutter_application_1/classes/product_card.dart';
import 'package:flutter_application_1/Popular%20items/all_products.dart';
//import 'package:flutter_application_1/location/locationuser.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ScaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Welcome(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Categorybutton(
                      title: "Food",
                      image: 'assets/images/food2.png',
                      onTap: () {}),
                  Categorybutton(
                      title: "Salad",
                      image: 'assets/images/salad.png',
                      onTap: () {}),
                  Categorybutton(
                      title: "Sweet",
                      image: 'assets/images/sweet.png',
                      onTap: () {}),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Items',
                    style: TextStyle(
                      color: AppColors.textcolor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push( // ← هون التعديل
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllProducts()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.btnColor,
                      side: BorderSide(color: AppColors.textcolor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textcolor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ProductCard(
                image: 'assets/images/brownie.png',
                title: 'Brownie',
                ingredients: 'Chocolate, butter, sugar, eggs, flour',
                price: 1.0,
              ),
              ProductCard(
                image: 'assets/images/lemon_cake.png',
                title: 'Lemon Cake',
                ingredients: 'Flour, sugar, eggs, milk, baking powder, lemon',
                price: 5.0,
              ),
              ProductCard(
                image: 'assets/images/madfoon.png',
                title: 'Madfoon Chicken',
                ingredients: 'Rice, Chicken, Potatoes, Saffron & Turmeric',
                price: 5.0,
              ),
              ProductCard(
                image: 'assets/images/kibbeh.png',
                title: 'Kibbeh',
                ingredients: 'Bulgur wheat, Minced meat, Onions & Toasted nuts, Middle Eastern spices',
                price: 1.50,
              ),
              ProductCard(
                image: 'assets/images/fattoush.png',
                title: 'Fattoush',
                ingredients: 'Lettuce, tomato, cucumber, radish, bread',
                price: 2.0,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}