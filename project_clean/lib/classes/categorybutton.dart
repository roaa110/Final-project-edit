import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/colors.dart';

class Categorybutton extends StatelessWidget{
  final String title;
  final String image;
  final VoidCallback onTap;
  const Categorybutton({
    super.key,
    required this.title,
     required this.image,
    required this.onTap,
    });
    @override
    Widget build(context){
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 110,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
           color:AppColors.btnColor,
           borderRadius: BorderRadius.circular(25),
          ),
           child:Column(
          children: [
            Image.asset(image,height: 85,width: 100,  
            ),
            const SizedBox(height: 5),
            Text(title,style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textcolor,
            ),)
          ],
        )
        ),
      );
    }
}