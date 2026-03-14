import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';

class ContentCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback? onTap;

  const ContentCard({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String posterUrl = item['poster'] ?? '';
    final String title = item['title']?.replaceFirst('فيلم ', '').replaceFirst('مسلسل ', '') ?? 'بدون عنوان';
    final String badge = item['badge'] ?? '';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 4), // Added margin
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (posterUrl.isNotEmpty)
                CachedNetworkImage(
                  imageUrl: posterUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: AppColors.surface,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                        strokeWidth: 2.0,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.surface,
                    child: const Center(
                      child: Icon(
                        Icons.broken_image_outlined,
                        color: AppColors.textSecondary,
                        size: 40,
                      ),
                    ),
                  ),
                )
              else
                Container(
                  color: AppColors.surface,
                  child: const Center(
                    child: Icon(
                      Icons.movie_creation_outlined,
                      color: AppColors.textSecondary,
                      size: 40,
                    ),
                  ),
                ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withAlpha(230)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.5, 1.0],
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 4,
                right: 4,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              if (badge.isNotEmpty)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
