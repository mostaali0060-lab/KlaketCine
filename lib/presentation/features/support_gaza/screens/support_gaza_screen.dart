import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';
import 'package:klaket_cine/presentation/shared/screens/main_screen.dart';

class SupportGazaScreen extends StatelessWidget {
  const SupportGazaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace with your image asset
            Image.asset(
              'assets/images/gaza.png', // Make sure to add your image to the assets folder
              height: 200,
              width: 200,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 150,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '#SupportGaza 🇵🇸',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'من أجل إخواننا في غزة، نرجو منكم الدعاء لهم',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 18,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              },
              child: const Text('المتابعة إلى التطبيق'),
            ),
          ],
        ),
      ),
    );
  }
}
