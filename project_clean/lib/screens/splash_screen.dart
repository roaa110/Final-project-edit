import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/background.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/utils/extenstion.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    transation();
  }

  @override
  Widget build(context) {
    return Stack(
      children: [
        Background(),
        Center(
          child: Image.asset(
            'assets/images/chat image.png',
            width: 300,
            height: 300,
          ),
        ),
      ],
    );
  }

  transation() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      context.pushReplacement(const Login());
    }
  }
}
