import 'package:flutter/material.dart';
import 'package:klaket_cine/Models/Series.dart';
import 'package:klaket_cine/Utils/Theme/AppColors.dart';

class ContentDetailsHeaderSection extends StatelessWidget {
  final clsSeries series;
  final bool isSeries;
  final int? episodesCount;
  final VoidCallback onWatchNowPressed;

  const ContentDetailsHeaderSection({
    super.key,
    required this.series,
    required this.isSeries,
    this.episodesCount,
    required this.onWatchNowPressed,
  });

  @override
  Widget build(BuildContext context) {
    const double posterWidth = 150;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Poster on the Right
          _buildPoster(series.Poster, posterWidth),
          const SizedBox(width: 16),
          // Text Details on the Left
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align content to the right (start in RTL)
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      series.Title,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // original_title, year, country, genre, duration are not in clsSeries Model.
                    // The UI will adapt and not show them.
                    const SizedBox(height: 16),
                    _buildTags(series.Label, null, null),
                    const SizedBox(height: 16),
                    _buildRating(series.Rating.toString()),
                  ],
                ),
                _buildStats(context, series.Views, series.CommentsCount),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoster(String? posterUrl, double width) {
    return Container(
      width: width,
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

  Widget _buildTags(String? status, String? genre, String? duration) {
    return Wrap(
      alignment: WrapAlignment.start, // Use start for RTL right-alignment
      spacing: 8,
      runSpacing: 8,
      children: [
        if (status != null) _buildStatusChip(status),
        if (genre != null) _buildInfoChip(genre, null),
        if (duration != null) _buildInfoChip(duration, Icons.nightlight_round),
      ],
    );
  }

  Widget _buildStatusChip(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF3E8E3E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildInfoChip(String text, IconData? icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (icon != null) ...[
            const SizedBox(width: 6),
            Icon(icon, color: AppColors.textSecondary, size: 14),
          ],
        ],
      ),
    );
  }

  Widget _buildRating(String? rating) {
    if (rating == null) return const SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          rating.replaceAll('.', '٫'),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        const Icon(Icons.star, color: Colors.amber, size: 20),
      ],
    );
  }

  Widget _buildStats(BuildContext context, int? views, int? comments) {
    String formattedViews = '0';
    if (views != null) {
      if (views >= 1000) {
        formattedViews = '${(views / 1000).toStringAsFixed(1)}K';
      } else {
        formattedViews = views.toString();
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (views != null) _buildStatItem(formattedViews, AppColors.surface, Icons.visibility_outlined),
        if (views != null && comments != null) const SizedBox(width: 12),
        if (comments != null) _buildStatItem('$comments تعليق', const Color(0xFFD32F2F), Icons.chat_bubble_outline_rounded),
      ],
    );
  }

  Widget _buildStatItem(String text, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Icon(icon, color: Colors.white, size: 16),
        ],
      ),
    );
  }
}
