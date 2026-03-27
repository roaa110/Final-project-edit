import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/app_text.dart';
import 'package:flutter_application_1/classes/colors.dart';
import 'package:flutter_application_1/classes/outlined_button.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() {
    return _ProfileUserState();
  }
}

class _ProfileUserState extends State<ProfileUser> {
  final Color customColor = Color.fromARGB(180, 61, 24, 5);

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: AppColors.ScaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            Center(
              child: Image.asset(
                'assets/images/chat image.png',
                width: 160,
                height: 160,
              ),
            ),
            SizedBox(height: 15),
            CustomAppText(
              text: 'Sawsan Aloran',
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: customColor,
              fontFamily: 'Cairo',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Edit Profile",
                    fontSize: 22,
                    iconData: Icons.edit,
                    onTap: () {},
                    radius: 40,
                    height: 60,
                    textColor: customColor,
                    buttonColor: Colors.white,
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Change Password",
                    fontSize: 22,
                    iconData: Icons.lock_outline,
                    onTap: () {},
                    radius: 40,
                    height: 60,
                    textColor: customColor,
                    buttonColor: Colors.white,
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            CustomButton(
              text: "Sign Out",
              fontSize: 22,
              iconData: Icons.logout,
              onTap: () {},
              radius: 40,
              width: 260,
              height: 55,
              textColor: customColor,
              buttonColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}