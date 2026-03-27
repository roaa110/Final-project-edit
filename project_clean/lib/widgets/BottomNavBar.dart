import 'package:flutter/material.dart';
import '../classes/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.activeIndex,
    required this.onTap,
    super.key,
  });

  final int activeIndex;
  final ValueChanged<int> onTap;

  static final _items = [
    ('assets/images/Home.png', 'Home'),
    ('assets/images/location.png', 'location'),
    ('assets/images/Shop.png', 'shop'),
    ('assets/images/reorder.png', 'reorder'),
    ('assets/images/profile.png', 'profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: AppColors.navColor,
        border: Border(
          top: BorderSide(color: AppColors.borderColor, width: 0.5),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_items.length, (i) {
            final item = _items[i];
            final isActive = i == activeIndex;
            final color = isActive ? AppColors.darkBrown : AppColors.fadedBrown;

            return GestureDetector(
              onTap: () => onTap(i),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  item.$1 is IconData
                      ? Icon(item.$1 as IconData, color: color, size: 28)
                      : Image.asset(
                        item.$1 as String,
                        width: 28,
                        height: 28,
                        color: color,
                        errorBuilder:
                            (context, error, stackTrace) =>
                                const Icon(Icons.error_outline, size: 28),
                      ),
                  const SizedBox(height: 4),
                  Text(
                    item.$2,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight:
                          isActive ? FontWeight.bold : FontWeight.normal,
                      color: color,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
