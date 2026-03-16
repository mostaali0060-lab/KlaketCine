import 'package:flutter/material.dart';
import '../../../../Models/Episode.dart';
import '../../../../Models/Season.dart';
import '../../../../Models/Series.dart';
import '../../../../Utils/Theme/AppColors.dart';

class WatchAndDownloadHeaderSection extends StatelessWidget {
  final clsSeries series;
  final clsSeason season;
  final clsEpisode episode;

  const WatchAndDownloadHeaderSection({
    super.key,
    required this.series,
    required this.season,
    required this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 16),
          Text(
            series.Title,
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'الموسم ${season.SeasonNumber} • الحلقة ${episode.EpisodeNumber}: ${episode.Title}',
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}