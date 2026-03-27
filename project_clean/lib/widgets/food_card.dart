import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/colors.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final String ingredients;
  final String price;
  final String? image;

  const FoodCard({
    super.key,
    required this.name,
    required this.ingredients,
    required this.price,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(14),          
      decoration: BoxDecoration(
        color: AppColors.btnColor,
        borderRadius: BorderRadius.circular(16),  
      ),
      child: Row(
        children: [

          Container(
            width: 100,                           
            height: 100,                          
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(14),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: image != null
                  ? Image.asset(image!, fit: BoxFit.cover)
                  : const Icon(Icons.fastfood, size: 40),
            ),
          ),

          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,                  
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  ingredients,
                  style: const TextStyle(
                    fontSize: 13,                  
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,                  
                  ),
                ),
              ],
            ),
          ),

          Column(
            children: [
              const Icon(Icons.favorite_border, size: 26), 
              const SizedBox(height: 16),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 61, 24, 5),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8),       
                  child: Icon(Icons.add, color: Colors.white, size: 22),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}