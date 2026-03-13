import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';

class StorySection extends StatelessWidget {
  final Map<String, dynamic> details;

  const StorySection({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('القصة'),
        const SizedBox(height: 16),
        Text(
          details['story'] ?? "لا تتوفر حاليا قصة",
          style: const TextStyle(
              color: AppColors.textSecondary, fontSize: 15, height: 1.6),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(width: 4, height: 20, color: AppColors.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
