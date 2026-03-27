import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/colors.dart';
import 'package:flutter_application_1/utils/responsive_size_helper.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color textColor;
  final Color buttonColor;
  final double fontSize;
  final double? height;
  final double? width;
  final double radius;
  final bool isOutlined;
  final bool isTextUnderlined;
  final IconData? iconData;
  final double borderWidth;
  final Color? borderColor;
  final double? size;
  final EdgeInsetsGeometry padding;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor = AppColors.textcolor,
    this.buttonColor = AppColors.btnColor,
    this.fontSize = 16,
    this.height,
    this.width,
    this.radius = 16,
    this.isOutlined = false,
    this.isTextUnderlined = false,
    this.iconData,
    this.borderWidth = 2,
    this.borderColor,
    this.size = 20,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    final double buttonHeight = height ?? responsiveHeight(context, 80);
    final double buttonWidth = width ?? responsiveWidth(context, 260);

    return Padding(
      padding: padding,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(radius),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: buttonWidth,
            height: buttonHeight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: isOutlined ? Colors.transparent : buttonColor,
              border: Border.all(
                color: borderColor ?? buttonColor,
                width: borderWidth,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 99, 98, 98),
                  offset: Offset(3, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (iconData != null)
                      Icon(
                        iconData,
                        size: size,
                        color: isOutlined ? buttonColor : textColor,
                      ),
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: isOutlined ? buttonColor : textColor,
                        decoration: isTextUnderlined
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: isOutlined ? buttonColor : AppColors.textcolor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}