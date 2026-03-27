import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/colors.dart';
import 'package:flutter_application_1/classes/search.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.ScaffoldBackgroundColor,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  size: 41,
                  color: Color.fromARGB(255, 61, 24, 5),
                ),
              ),
              SizedBox(width: 10),
              Text(
                'Welcome!',
                style: TextStyle(
                  color: Color.fromARGB(255, 61, 24, 5),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Row(
            children: [
              Image.asset(
                'assets/images/chat image.png',
                width: 120,
                height: 120,
              ),
              SizedBox(width: 0),
              Expanded(child: Search()),
            ],
          ),
        ],
      ),
    );
  }
}