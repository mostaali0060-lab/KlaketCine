import 'package:flutter/material.dart';
import 'package:klaket_cine/Utils/Theme/AppColors.dart';

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
        width: 250,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand, // Make stack children fill the space
            children: [
              // Image
              Image.network(
                episode['thumbnail'],
                fit: BoxFit.cover, // This will make the image cover the entire space
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.surface,
                  child: const Icon(Icons.image_not_supported, color: AppColors.textSecondary),
                ),
              ),

              // Gradient overlay for text readability
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withAlpha(26), // 0.1 opacity
                      Colors.black.withAlpha(230), // 0.9 opacity
                    ],
                    stops: const [0.5, 0.7, 1.0],
                  ),
                ),
              ),

              // Play Icon
              const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50,
              ),

              // Duration Tag
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(153), // 0.6 opacity
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    episode['duration'],
                    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // Title and Episode Info
              Positioned(
                bottom: 8,
                right: 8,
                left: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Ensure column takes minimum space
                  children: [
                    Text(
                      episode['series_title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'الحلقة ${episode['episode_number']}',
                      style: TextStyle(
                        color: Colors.white.withAlpha(204), // 0.8 opacity
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}