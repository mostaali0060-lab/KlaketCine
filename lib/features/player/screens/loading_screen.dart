import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';

class EpisodeLoadingScreen extends StatelessWidget {
  const EpisodeLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: AppColors.surface.withAlpha(128),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.theaters_rounded,
                color: AppColors.primary,
                size: 50,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'كلاكيت سينما',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'جاري تحميل الحلقة...',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 18,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, color: AppColors.primary, size: 12),
                SizedBox(width: 8),
                Icon(Icons.circle, color: AppColors.primary, size: 12),
                SizedBox(width: 8),
                Icon(Icons.circle, color: AppColors.primary, size: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
