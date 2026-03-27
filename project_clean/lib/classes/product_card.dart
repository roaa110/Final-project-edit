import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/colors.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String ingredients;
  final double price;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.ingredients,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.btnColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromARGB(60, 61, 24, 5),
          width: 0.8,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textcolor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  ingredients,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(150, 61, 24, 5),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  '${price.toStringAsFixed(2)} JOD',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textcolor,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.favorite_border,
                  color: AppColors.textcolor,
                  size: 22,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.textcolor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}