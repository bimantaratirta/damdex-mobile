import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shareds/widgets/app_icon.dart';
import '../../../theme/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: AppIcon(width: 150),
        ),
      ),
    );
  }
}
