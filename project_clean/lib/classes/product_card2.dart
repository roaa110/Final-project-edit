import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/colors.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final double price;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 420,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: AppColors.btnColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.bordercolor,
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(
            image,
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textcolor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${price.toStringAsFixed(2)} JOR",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.textcolor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}