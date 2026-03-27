import 'package:flutter/material.dart';
import '../classes/colors.dart';

Widget bottomPill() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppColors.reorderBtnBorder, width: 1.5),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 12,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: const Text(
          'Madfoon Chicken 1 Dish',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.titleText,
          ),
        ),
      ),
    );
