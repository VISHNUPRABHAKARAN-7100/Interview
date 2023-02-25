import 'dart:async';
import 'package:flutter/material.dart';
import 'package:inteview/utils/constant_colors.dart';
import 'package:inteview/widgets/logo/logo_widget.dart';
import '../../registration_page/view/registration_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>  RegistrationPage(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.greenColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            LogoWidget(
              logoTextColor: ConstantColors.greenColor,
              logoBackgroundtColor: ConstantColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
