import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:user_test/views/common/common_text.dart';

import '../../../constant/constant_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.userHomeScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: AnimatedRotation(
          turns: 2,
          duration: Duration(seconds: 2),
          child: CommonText(
            AppStrings.userData,
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
