import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const SectionHeader({super.key, required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // --- Start of UI Enhancement ---
          Row(
            children: [
              Container(
                width: 4,
                height: 20, // Match the approximate height of the title
                color: AppColors.primary,
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
            ],
          ),
          // --- End of UI Enhancement ---
          if (onSeeAll != null)
            TextButton(
              onPressed: onSeeAll,
              child: const Text('عرض الكل'),
            ),
        ],
      ),
    );
  }
}
