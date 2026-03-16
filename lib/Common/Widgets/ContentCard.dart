import 'package:flutter/material.dart';
import '../../Models/Series.dart';
import '../../Utils/Theme/AppColors.dart';

class ContentCard extends StatelessWidget {
  final clsSeries Series;
  final VoidCallback? onTap;

  const ContentCard({
    super.key,
    required this.Series,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 155,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildImage(Series.Poster),
              // Top Badge
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.background.withAlpha(150),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '23',
                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 2),
                      Icon(Icons.play_arrow, color: Colors.white, size: 12),
                    ],
                  ),
                ),
              ),
              // Gradient Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.background.withAlpha(100),
                      AppColors.background.withAlpha(220),
                      AppColors.background,
                    ],
                    stops: const [0.4, 0.7, 0.9, 1.0],
                  ),
                ),
              ),
              // Title inside the card
              Positioned(
                bottom: 12,
                right: 12,
                left: 12,
                child: Text(
                  Series.Title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String? path) {
    if (path == null || path.isEmpty) {
      return Image.asset('images/poster.jpg', fit: BoxFit.cover);
    }

    if (path.startsWith('assets/')) {
      // Strip 'assets/' prefix because Image.asset prepends it automatically on Web
      final cleanPath = path.replaceFirst('assets/', '');
      return Image.asset(
        cleanPath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Image.asset('images/poster.jpg', fit: BoxFit.cover),
      );
    } else {
      return Image.network(
        path,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: AppColors.surface,
            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        },
        errorBuilder: (context, error, stackTrace) => Image.asset('images/poster.jpg', fit: BoxFit.cover),
      );
    }
  }
}