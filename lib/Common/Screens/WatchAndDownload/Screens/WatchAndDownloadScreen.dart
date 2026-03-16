import 'package:flutter/material.dart';
import '../../../../Models/Episode.dart';
import '../../../../Models/Season.dart';
import '../../../../Models/Series.dart';
import '../../../../Utils/Theme/AppColors.dart';
import '../Widgets/DownloadServersSection.dart';
import '../Widgets/WatchAndDownloadHeaderSection.dart';
import '../Widgets/WatchServersSection.dart';

class WatchAndDownloadScreen extends StatelessWidget {
  final clsSeries series;
  final clsSeason season;
  final clsEpisode episode;

  const WatchAndDownloadScreen({
    super.key,
    required this.series,
    required this.season,
    required this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WatchAndDownloadHeaderSection(
                  series: series,
                  season: season,
                  episode: episode,
                ),
                const SizedBox(height: 24),
                WatchServersSection(watchServers: episode.WatchServers),
                const SizedBox(height: 24),
                DownloadServersSection(downloadServers: episode.DownloadServers),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      pinned: true,
      expandedHeight: 250,
      automaticallyImplyLeading: false,
      title: Align(
        alignment: Alignment.centerRight,
        child: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          label: const Text(
            'الرجوع للمسلسل',
            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.white),
          onPressed: () {},
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              episode.Thumbnail,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/poster.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.0, 0.9],
                  colors: [
                    AppColors.background,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}