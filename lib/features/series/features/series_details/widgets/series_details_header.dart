import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';

class SeriesDetailsHeader extends StatelessWidget {
  final Map<String, dynamic> details;
  final bool isSeries;
  final int? episodesCount;

  const SeriesDetailsHeader({
    super.key,
    required this.details,
    required this.isSeries,
    this.episodesCount,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final posterWidth = screenWidth * 0.3; // Adjust this for a good look
    final posterHeight = posterWidth * 1.5;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              details['cover'] ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(color: AppColors.surface),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withAlpha(153),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildDetailsColumn(context, details,
                      CrossAxisAlignment.start, isSeries, episodesCount),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: posterWidth,
                  height: posterHeight,
                  child: _buildPosterImage(context, details['cover'] ?? '',
                      posterWidth, posterHeight),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPosterImage(
      BuildContext context, String posterUrl, double width, double height) {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          posterUrl,
          width: width,
          height: height,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            width: width,
            height: height,
            color: AppColors.surface,
            child: const Icon(Icons.broken_image,
                color: AppColors.textSecondary, size: 40),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsColumn(
      BuildContext context,
      Map<String, dynamic> details,
      CrossAxisAlignment crossAxisAlignment,
      bool isSeries,
      int? episodesCount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          details['title'] ?? 'باب الحارة',
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          "Bab Al Hara", // Placeholder for English title
          style: TextStyle(fontSize: 16, color: Colors.grey[400]),
        ),
        const SizedBox(height: 12),
        Text(
          "${details['year'] ?? '2023'} • ${details['country'] ?? 'سوريا'} • 60 دقيقة",
          style: TextStyle(fontSize: 13, color: Colors.grey[300]),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('شاهد الآن'),
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF00A849), // Green color from image
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
            ),
            const SizedBox(width: 12),
            _buildBadge(
                details['genre'] ?? 'دراما', Colors.transparent, Colors.white,
                hasBorder: true),
            const SizedBox(width: 12),
            const Icon(Icons.star, color: Color(0xFFFFC107), size: 18),
            const SizedBox(width: 4),
            Text(
              "Rating ${details['rating']?.toString() ?? '8.1'}",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _buildStat(Icons.visibility_outlined, "143.8K", "مشاهدة"),
            const SizedBox(width: 24),
            _buildStat(Icons.chat_bubble_outline, "22.1K", "تعليق"),
          ],
        ),
        const SizedBox(height: 10), // Some bottom padding
      ],
    );
  }

  Widget _buildStat(IconData icon, String value, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[400], size: 20),
        const SizedBox(width: 8),
        Text(value,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(color: Colors.grey[400], fontSize: 14)),
      ],
    );
  }

  Widget _buildBadge(String text, Color bgColor, Color textColor,
      {double fontSize = 12, bool hasBorder = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: hasBorder
            ? Border.all(color: Colors.white.withAlpha(128), width: 1)
            : null,
      ),
      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}
