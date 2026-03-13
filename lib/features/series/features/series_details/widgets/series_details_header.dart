import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';
import 'package:klaket_cine/shared/widgets/watch_now_button.dart';

class SeriesDetailsHeader extends StatelessWidget {
  final Map<String, dynamic> details;
  final bool isSeries;
  final int? episodesCount;
  final VoidCallback onWatchNowPressed;

  const SeriesDetailsHeader({
    super.key,
    required this.details,
    required this.isSeries,
    this.episodesCount,
    required this.onWatchNowPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Set a fixed size for the poster as requested.
    const double posterWidth = 150;
    const double posterHeight = posterWidth * 1.5;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPoster(details['poster'], posterWidth, posterHeight),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                details['title'] ?? 'بدون عنوان',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildSubtitle(details['original_title']),
              const SizedBox(height: 8),
              _buildMetaInfo(details['year'], details['country'], details['duration']),
              const SizedBox(height: 16),
              Row(
                children: [
                  _buildRating(details['rating']?.toString()),
                  const SizedBox(width: 12),
                  _buildGenre(details['genre']),
                ],
              ),
              const SizedBox(height: 24),
              _buildActionButtons(context, onWatchNowPressed, isSeries,
                  details['comments_count'], details['views_count'])
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPoster(
      String? posterUrl, double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        image: posterUrl != null
            ? DecorationImage(
                image: NetworkImage(posterUrl),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: posterUrl == null
          ? const Icon(Icons.movie, color: AppColors.textSecondary, size: 40)
          : null,
    );
  }

  Widget _buildSubtitle(String? subtitle) {
    if (subtitle == null) return const SizedBox.shrink();
    return Text(
      subtitle,
      style: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildMetaInfo(String? year, String? country, String? duration) {
    final List<String> meta = [];
    if (year != null) meta.add(year);
    if (country != null) meta.add(country);
    if (duration != null) meta.add('$duration دقيقة');

    if (meta.isEmpty) return const SizedBox.shrink();

    return Text(
      meta.join(' • '),
      style: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
      ),
    );
  }

  // Original Rating Widget
  Widget _buildRating(String? rating) {
    if (rating == null) return const SizedBox.shrink();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Rating',
          style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.star, color: Colors.amber, size: 18),
        const SizedBox(width: 4),
        Text(
          rating,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildGenre(String? genre) {
    if (genre == null) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textSecondary, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genre,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, VoidCallback onWatchNow, bool isSeries, int? commentsCount, int? viewsCount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isSeries)
          WatchNowButton(
            onPressed: onWatchNow,
            text: episodesCount != null ? 'شاهد الآن ($episodesCount حلقات)' : 'شاهد الآن',
          ),
        if (!isSeries)
          WatchNowButton(onPressed: onWatchNow, text: 'شاهد الآن'),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildInfoChip(Icons.comment_outlined, '$commentsCount تعليق', context),
            const SizedBox(width: 12),
            _buildInfoChip(Icons.visibility_outlined, viewsCountK, context),
          ],
        )
      ],
    );
  }

  Widget _buildInfoChip(IconData icon, String label, BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary.withAlpha(51), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.textSecondary, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  String get viewsCountK {
    final views = details['views_count'];
    if (views == null) return '0';
    if (views >= 1000) {
      return '${(views / 1000).toStringAsFixed(0)}K';
    }
    return views.toString();
  }
}
