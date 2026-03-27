import 'package:flutter/material.dart';
import '../classes/colors.dart';

Widget header() => Padding(
  padding: const EdgeInsets.fromLTRB(24, 10, 24, 6),
  child: Column(
    children: [
      const Text(
        'Reorder',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.titleText,
        ),
      ),
      const SizedBox(height: 6),
      const Text(
        'Would you like to reorder your favorite dishes?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22,
          color: AppColors.subtitleText,
          fontStyle: FontStyle.italic,
          height: 1.5,
        ),
      ),
    ],
  ),
);
