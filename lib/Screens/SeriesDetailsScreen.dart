import 'package:flutter/material.dart';
import '../Core/Constants/AppColors.dart';
import '../Data/DummyData.dart';
import '../Widgets/Series/SeasonSelectorWidget.dart';
import '../Widgets/Series/SimpleEpisodeCard.dart';

class SeriesDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> item;

  const SeriesDetailsScreen({super.key, required this.item});

  @override
  State<SeriesDetailsScreen> createState() => _SeriesDetailsScreenState();
}

class _SeriesDetailsScreenState extends State<SeriesDetailsScreen> {
  late Map<String, dynamic> _selectedSeason;

  @override
  void initState() {
    super.initState();
    _selectedSeason = DummyData.seasonsInfo.first;
  }

  void _showSeasonsBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SeasonsBottomSheet(
          seasons: DummyData.seasonsInfo,
          selectedSeason: _selectedSeason,
          onSeasonSelected: (season) {
            setState(() {
              _selectedSeason = season;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const details = DummyData.seriesDetailsInfo;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopInfo(details),
            const SizedBox(height: 24),
            _buildSectionDivider(),
            const SizedBox(height: 24),
            _buildStorySection(details),
            const SizedBox(height: 24),
            _buildSectionDivider(),
            const SizedBox(height: 24),
            _buildSeasonsAndEpisodes(),
            const SizedBox(height: 24),
            _buildSectionDivider(),
            const SizedBox(height: 24),
            _buildSimilarSection(),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildTopInfo(Map<String, dynamic> details) {
    final String posterUrl = details['cover'] ?? '';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
                  posterUrl,
                  width: 140,
                  height: 210,
                  fit: BoxFit.cover,
                ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                details['title'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                details['en_title'],
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(details['country'], style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text('•', style: TextStyle(color: AppColors.textSecondary)),
                  ),
                  Text(details['year'], style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildBadge(details['status'], AppColors.badgeGreen, Colors.white),
                  _buildBadge(DummyData.featuredHero.first['genre'], AppColors.badgeDark, Colors.white),
                  _buildBadge('${details['episodes_count']} 🌙', AppColors.badgeDark, Colors.white),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(Icons.star, color: AppColors.ratingStar, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    details['rating'].toString(),
                    style: const TextStyle(
                      color: AppColors.ratingStar,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 14),
                        const SizedBox(width: 6),
                        Text(
                          '${details['comments']} تعليق',
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.badgeDark,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.visibility_outlined, color: AppColors.textSecondary, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          details['views'],
                          style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBadge(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSectionDivider() {
    return const Divider(color: Color(0xFF1E1E1E), height: 1, thickness: 1);
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          color: AppColors.primary,
        ),
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

  Widget _buildStorySection(Map<String, dynamic> details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('القصة'),
        const SizedBox(height: 16),
        Text(
          details['story'],
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 15,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildSeasonsAndEpisodes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('المواسم والحلقات'),
        const SizedBox(height: 16),
        SeasonSelectorWidget(
          selectedSeason: _selectedSeason,
          onTap: _showSeasonsBottomSheet,
        ),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.85,
          ),
          itemCount: DummyData.episodes.length,
          itemBuilder: (context, index) {
            return SimpleEpisodeCard(episode: DummyData.episodes[index]);
          },
        ),
      ],
    );
  }

  Widget _buildSimilarSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('قد يعجبك أيضاً'),
        const SizedBox(height: 16),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: DummyData.moviesList.length,
            itemBuilder: (context, index) {
              final item = DummyData.moviesList[index];
              final String posterUrl = item['poster'] ?? '';

              return Container(
                margin: const EdgeInsets.only(left: 12),
                width: 110,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                              posterUrl,
                              fit: BoxFit.cover,
                            ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.4],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Text(
                        item['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
