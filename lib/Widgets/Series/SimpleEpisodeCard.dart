import 'package:flutter/material.dart';
import '../../Core/Constants/AppColors.dart';

class SimpleEpisodeCard extends StatelessWidget {
  final Map<String, dynamic> episode;

  const SimpleEpisodeCard({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    final String posterUrl = episode['image'] ?? '';

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.network(
                  posterUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.surface,
                    child: const Icon(Icons.broken_image, color: AppColors.textSecondary),
                  ),
                ),
          // Overlay
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          // Centered Text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'الحلقة',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${episode['number']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
