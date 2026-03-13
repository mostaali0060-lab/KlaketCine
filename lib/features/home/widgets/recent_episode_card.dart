import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';

class RecentEpisodeCard extends StatelessWidget {
  final Map<String, dynamic> episode;
  final VoidCallback? onTap;

  const RecentEpisodeCard({super.key, required this.episode, this.onTap});

  void _defaultOnTap() {
    // Tapped on episode: ${episode['series_title']}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? _defaultOnTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    episode['thumbnail'],
                    height: 90,
                    width: 160,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 90,
                      width: 160,
                      color: AppColors.surface,
                      child: const Icon(Icons.image_not_supported, color: AppColors.textSecondary),
                    ),
                  ),
                ),
                Container(
                  height: 90,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black.withAlpha(77),
                  ),
                ),
                const Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 40,
                ),
                 Positioned(
                  top: 4,
                  left: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(179),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      episode['duration'],
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              episode['series_title'], // Corrected key
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'الحلقة ${episode['episode_number']}', // Corrected keys
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
