import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/colors.dart';
import 'package:flutter_application_1/classes/product_card.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.btnColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.textcolor,
          ),
        ),
        title: Text(
          'Popular Items',
          style: TextStyle(
            color: AppColors.textcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: Column(
          children: [
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
    );
  }
}