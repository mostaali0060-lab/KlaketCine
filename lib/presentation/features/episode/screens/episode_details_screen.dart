import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';

class EpisodeDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> seriesDetails;
  final Map<String, dynamic> selectedSeason;
  final Map<String, dynamic> episode;

  const EpisodeDetailsScreen({
    super.key,
    required this.seriesDetails,
    required this.selectedSeason,
    required this.episode,
  });

  @override
  Widget build(BuildContext context) {

    // Dummy data from the user's design
    final List<Map<String, dynamic>> watchServersData = [
      {
        'name': 'سيرفر 1 (رئيسي)',
        'quality': 'سيرفر سريع • FHD',
      },
      {
        'name': 'سيرفر 2',
        'quality': 'سيرفر بديل • HD',
      },
      {
        'name': 'سيرفر 3',
        'quality': 'سيرفر بديل • SD',
      },
    ];

    final List<Map<String, dynamic>> downloadLinksData = [
      {
        'quality': 'FHD',
        'size': '1080p • 1.2 GB',
      },
      {
        'quality': 'HD',
        'size': '720p • 750 MB',
      },
      {
        'quality': 'SD',
        'size': '480p • 400 MB',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          _buildContent(context, watchServersData, downloadLinksData, AppColors.primaryRed),
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
                episode['thumbnail'] ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/poster.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColors.background.withAlpha(204),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  SliverToBoxAdapter _buildContent(
      BuildContext context, List<Map<String, dynamic>> watchServersData, List<Map<String, dynamic>> downloadLinksData, Color primaryRed) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              seriesDetails['title'],
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'الموسم ${selectedSeason['season_number']} • الحلقة ${episode['episode_number']}: ${episode['title']}',
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('سيرفرات المشاهدة', primaryRed),
            const SizedBox(height: 16),
            ...watchServersData.map((server) => _buildServerItem(context, server, server == watchServersData.first, primaryRed)),
            const SizedBox(height: 24),
            _buildSectionTitle('تحميل الحلقة', primaryRed),
            const SizedBox(height: 16),
            ...downloadLinksData.map((link) => _buildDownloadItem(context, link, primaryRed)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(width: 4, height: 20, color: color),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildServerItem(BuildContext context, Map<String, dynamic> server, bool isSelected, Color primaryColor) {
    return Card(
      color: isSelected ? primaryColor : AppColors.surface,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                isSelected ? Icons.check_circle_outline_rounded : Icons.chevron_left_rounded,
                color: Colors.white,
                size: isSelected ? 24 : 22,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        server['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        server['quality'],
                        style: TextStyle(
                          color: isSelected ? Colors.white70 : AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    isSelected ? Icons.play_circle_fill_rounded : Icons.play_circle_outline_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadItem(BuildContext context, Map<String, dynamic> link, Color primaryColor) {
    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.chevron_left_rounded, color: Colors.white, size: 22),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'تحميل بجودة ${link['quality']}',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        link['size'],
                        style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.download_rounded, color: primaryColor, size: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
