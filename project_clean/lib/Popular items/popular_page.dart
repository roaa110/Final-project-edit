import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/colors.dart';
import 'package:flutter_application_1/widgets/food_card.dart';
import 'package:flutter_application_1/search_page.dart';

class PopularPage extends StatelessWidget {
  const PopularPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List foods = [
      {
        "name": "Brownie",
        "ingredients": "Chocolate, butter, sugar, eggs, flour",
        "price": "1 JOD",
        "image": "assets/images/brownie.png",
      },
      {
        "name": "Lemon Cake",
        "ingredients": "Flour, sugar, eggs, milk, oil, baking powder",
        "price": "5 JOD",
        "image": "assets/images/lemon_cake.png",
      },
      {
        "name": "Madfoon Chicken",
        "ingredients": "Rice, Chicken, Potatoes, Saffron & Turmeric",
        "price": "5 JOD",
        "image": "assets/images/madfoon.png",
      },
      {
        "name": "Kibbeh",
        "ingredients": "Bulgur wheat, Minced meat, Onions & Toasted nuts",
        "price": "1.50 JOD",
        "image": "assets/images/kibbeh.png",
      },
      {
        "name": "Fattoush",
        "ingredients": "Lettuce, tomato, cucumber, radish, bread",
        "price": "2 JOD",
        "image": "assets/images/fattoush.png",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.ScaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: AppColors.ScaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchPage()),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.btnColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  "Search",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Popular items",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  final food = foods[index];
                  return FoodCard(
                    name: food["name"],
                    ingredients: food["ingredients"],
                    price: food["price"],
                    image: food["image"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}