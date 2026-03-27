import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/colors.dart';
import 'package:flutter_application_1/welcome.dart';
import 'package:flutter_application_1/classes/product_card2.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key});

  void seeAllPressed(BuildContext context) {
    print("See All pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ScaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Welcome(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular items',
                    style: TextStyle(
                      color: AppColors.textcolor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.btnColor,
                      side: BorderSide(color: AppColors.bordercolor, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    onPressed: () => seeAllPressed(context),
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
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductCard(
                      image: 'assets/images/grapleaves.png',
                      title: 'Stuffed Grap Leaves',
                      price: 1.0,
                    ),
                    ProductCard(
                      image: 'assets/images/tabbuleh.png',
                      title: 'Tabbuleh',
                      price: 0.50,
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}