import 'package:flutter/material.dart';
import 'colors.dart';

class CustomAppText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextOverflow? overflow;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool isUnderlined;
  final Color? color;
  final Color? underlineColor;
  final bool hasShadow;
  final bool hasPadding;
  final String? fontFamily; // ✅ أضفنا هذا

  const CustomAppText({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.start,
    this.isUnderlined = false,
    this.color,
    this.underlineColor,
    this.hasShadow = false,
    this.hasPadding = false,
    this.maxLines,
    this.overflow,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? AppColors.textcolor,
        decoration:
        isUnderlined ? TextDecoration.underline : TextDecoration.none,
        decorationColor: underlineColor ?? AppColors.bordercolor,
        decorationThickness: 1.0,
        shadows: hasShadow
            ? [
          const Shadow(
            color: Colors.grey,
            offset: Offset(1, 1),
            blurRadius: 2,
          ),
        ]
            : null,
      ),
    );

    if (hasPadding) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: textWidget,
      );
    } else {
      return textWidget;
    }
  }
}
