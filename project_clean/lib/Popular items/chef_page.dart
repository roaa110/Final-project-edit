import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/colors.dart';
import 'package:flutter_application_1/utils/responsive_size_helper.dart';

class ChefPage extends StatelessWidget {
  final String name;
  final double rating;
  final String description;
  final List topDishes;

  const ChefPage({
    super.key,
    required this.name,
    required this.rating,
    required this.description,
    required this.topDishes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ScaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: responsiveWidth(context, 20),
                top: responsiveHeight(context, 10),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                    backgroundColor: AppColors.btnColor,
                    child: Icon(Icons.arrow_back_ios, color: AppColors.textcolor),
                  ),
                ),
              ),
            ),

            SizedBox(height: responsiveHeight(context, 10)),
            CircleAvatar(
              radius: responsiveWidth(context, 35),
              backgroundColor: AppColors.btnColor,
              child: Icon(Icons.person, size: responsiveWidth(context, 40), color: AppColors.textcolor),
            ),

            SizedBox(height: responsiveHeight(context, 10)),
            Text(
              name,
              style: TextStyle(
                fontSize: responsiveWidth(context, 18),
                fontWeight: FontWeight.bold,
                color: AppColors.textcolor,
              ),
            ),

            SizedBox(height: responsiveHeight(context, 6)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) {
                if (i < rating.floor()) {
                  return Icon(Icons.star, size: 18, color: AppColors.textcolor);
                } else if (i < rating) {
                  return Icon(Icons.star_half, size: 18, color: AppColors.textcolor);
                } else {
                  return Icon(Icons.star_border, size: 18, color: AppColors.textcolor);
                }
              }),
            ),

            SizedBox(height: responsiveHeight(context, 12)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 25)),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: responsiveWidth(context, 13),
                  color: AppColors.textcolor,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            SizedBox(height: responsiveHeight(context, 20)),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(responsiveWidth(context, 16)),
                decoration: BoxDecoration(
                  color: AppColors.btnColor,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Top Dishes",
                      style: TextStyle(
                        fontSize: responsiveWidth(context, 16),
                        fontWeight: FontWeight.bold,
                        color: AppColors.textcolor,
                      ),
                    ),

                    SizedBox(height: responsiveHeight(context, 10)),

                    Expanded(
                      child: GridView.builder(
                        itemCount: topDishes.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.85,
                        ),
                        itemBuilder: (context, index) {
                          var dish = topDishes[index];
                          return Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.ScaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: dish['image'] != null
                                        ? Image.asset(
                                            dish['image'],
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) =>
                                                Container(
                                                  color: const Color.fromARGB(40, 61, 24, 5),
                                                  child: const Icon(Icons.fastfood, size: 40),
                                                ),
                                          )
                                        : Container(
                                            color: const Color.fromARGB(40, 61, 24, 5),
                                            child: const Icon(Icons.fastfood, size: 40),
                                          ),
                                  ),
                                ),

                                SizedBox(height: responsiveHeight(context, 6)),

                                Text(
                                  dish['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textcolor,
                                    fontSize: 13,
                                  ),
                                ),

                                
      

                                SizedBox(height: responsiveHeight(context, 4)),
                                Text(
                                  "${dish['price']} JOD",
                                  style: TextStyle(
                                    color: AppColors.textcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}