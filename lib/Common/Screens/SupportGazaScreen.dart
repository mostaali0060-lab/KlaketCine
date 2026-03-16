import 'dart:async';
import 'package:flutter/material.dart';
import 'package:klaket_cine/Utils/Theme/AppColors.dart';
import 'package:klaket_cine/Home/HomeScreen.dart';

class SupportGazaScreen extends StatefulWidget {
  const SupportGazaScreen({super.key});

  @override
  State<SupportGazaScreen> createState() => _SupportGazaScreenState();
}

class _SupportGazaScreenState extends State<SupportGazaScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryRed.withOpacity(0.5), width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'فلسطين',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'تضامناً مع قضيتنا العادلة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'معاً نساند الأمل، ونبني جسور المحبة والإخاء',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  fontFamily: 'Cairo',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryRed),
              ),
            ],
          ),
        ),
      ),
    );
  }
}