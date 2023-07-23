import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page/home_page.dart';
import 'package:weather_app/pages/spash_page/splash_page.dart';

class SplashLoading extends StatefulWidget {
  const SplashLoading({super.key});

  @override
  State<SplashLoading> createState() => _SplashLoadingState();
}

class _SplashLoadingState extends State<SplashLoading> {
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      Timer(const Duration(seconds: 3), () {
        setState(() {
          isInitialized = true;
        });
      }); 
    }

    return Stack(
      children: [
        const HomePage(),
        Visibility(
          visible: !isInitialized,
          child: const SplashPage(),
        ),
      ],
    );
  }
}
