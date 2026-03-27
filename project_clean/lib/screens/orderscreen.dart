import 'package:flutter/material.dart';
import '../widgets/backButton.dart';
import '../classes/app_text.dart';
import '../classes/colors.dart';

import '../widgets/BottomNavBar.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  int _activeNav = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  backButton(context),
                  const SizedBox(height: 10),
                  const SizedBox(
                    width: double.infinity,
                    child: CustomAppText(
                      text: 'Track Order',
                      fontSize: 32,
                      textAlign: TextAlign.center,
                      fontFamily: 'Trajan Pro',
                      color: AppColors.darkBrown,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 2, 20, 18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomAppText(
                  text: 'Order ID :3756',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Schyler',
                  color: AppColors.medBrown,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildCheckStep(label: 'Placed', showLine: true),
                      _buildCheckStep(label: 'Confirmed', showLine: true),
                      _buildImageStep(
                        imagePath: 'assets/images/chef.png',
                        label: 'Being Prepared',
                        isActive: true,
                        showLine: true,
                      ),
                      _buildImageStep(
                        imagePath: 'assets/images/car.png',
                        label: 'Out for Delivery',
                        isActive: false,
                        showLine: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomAppText(
                      text: '1x Tabbouleh\n1x Kibbeh',
                      fontSize: 15,
                      fontFamily: 'Schyler',
                      color: AppColors.medBrown,
                    ),
                    CustomAppText(
                      text: '6.50 JOD',
                      fontSize: 16,
                      fontFamily: 'Schyler',
                      color: AppColors.medBrown,
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

  Widget _buildCheckStep({required String label, required bool showLine}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            _arcCircle(
                child: const Icon(Icons.check,
                    color: AppColors.darkBrown, size: 26)),
            if (showLine) _connector(),
          ],
        ),
        const SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CustomAppText(
            text: label,
            fontSize: 28,
            fontFamily: 'Schyler',
            fontWeight: FontWeight.w400,
            color: AppColors.medBrown,
          ),
        ),
      ],
    );
  }

  Widget _buildImageStep({
    required String imagePath,
    required String label,
    required bool isActive,
    required bool showLine,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.bgColor,
                border: Border.all(
                  color: isActive ? AppColors.darkBrown : AppColors.fadedBrown,
                  width: isActive ? 2.5 : 2,
                ),
              ),
              child: ClipOval(
                child: Opacity(
                  opacity: isActive ? 1.0 : 0.4,
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
            ),
            if (showLine) _connector(),
          ],
        ),
        const SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CustomAppText(
            text: label,
            fontSize: 28,
            fontFamily: 'Schyler',
            fontWeight: FontWeight.w400,
            color: isActive ? AppColors.medBrown : AppColors.fadedBrown,
          ),
        ),
      ],
    );
  }

  Widget _arcCircle({required Widget child}) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(48, 48),
            painter: _ArcPainter(),
          ),
          child,
        ],
      ),
    );
  }

  Widget _connector() => Container(
        width: 2.5,
        height: 25,
        color: AppColors.medBrown.withOpacity(0.2),
      );
}

class _ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      size.center(Offset.zero),
      size.width / 2,
      Paint()
        ..color = const Color(0xFFFCF5DE)
        ..style = PaintingStyle.fill,
    );
    canvas.drawArc(
      Rect.fromCircle(
          center: size.center(Offset.zero), radius: size.width / 2 - 1.25),
      0.6,
      5.65,
      false,
      Paint()
        ..color = AppColors.darkBrown
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}
