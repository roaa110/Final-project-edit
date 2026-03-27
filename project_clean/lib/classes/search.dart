import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/colors.dart';
import 'package:flutter_application_1/utils/responsive_size_helper.dart';
import 'package:flutter_application_1/classes/app_text.dart';
import 'package:flutter_application_1/search_page.dart';

class Search extends StatelessWidget {
  final double? width;
  const Search({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchPage()),
        );
      },
       child: Container(
        width: responsiveWidth(context, 320), // control box length
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.btnColor,
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.inner,
            ),
          ],
          border: Border.all(color: Color.fromARGB(255, 61, 24, 5), width: 1.0),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // keep icon & text left
          children: [
            Icon(
              Icons.search,
              size: responsiveWidth(context, 20),
              color: AppColors.textcolor,
            ),
            SizedBox(width: responsiveWidth(context, 10)), // small gap
            CustomAppText(
              text: "Search",
              textAlign: TextAlign.left,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 61, 24, 5),
            ),
          ],
        ),
      ),
    );
  }
}