import 'package:flutter/material.dart';
import '../classes/colors.dart';

Widget dishCard({required bool reordering, required VoidCallback onReorder}) =>
    Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBg, width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 16,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/A1.jpg',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Madfoon Chicken',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.titleText,
                  ),
                ),
                const Text(
                  'Ordered 1 week ago',
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColors.subtitleText,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Rice, Chicken, Potatoes,\nSaffron & Turmeric',
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.ingredientsText,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '7.00 JOD',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.titleText,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    GestureDetector(
                      onTap: onReorder,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.reorderBtnBorder,
                            width: 1.5,
                          ),
                          boxShadow:
                              reordering
                                  ? [
                                    BoxShadow(
                                      color: AppColors.ingredientsText
                                          .withValues(alpha: 0.2),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                    ),
                                  ]
                                  : [],
                        ),
                        child: Text(
                          reordering ? 'Adding...' : 'Reorder',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color:
                                reordering
                                    ? AppColors.ingredientsText
                                    : AppColors.titleText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
