import 'package:flutter/material.dart';
import 'package:klaket_cine/data/dummy_data.dart';
import 'package:klaket_cine/presentation/features/home/widgets/hero_slider.dart';
import 'package:klaket_cine/presentation/features/home/widgets/recent_episode_card.dart';
import 'package:klaket_cine/presentation/features/home/widgets/telegram_promo_card.dart';
import 'package:klaket_cine/presentation/features/player/screens/episode_player_loader.dart';
import 'package:klaket_cine/presentation/features/series/features/series_details/screens/series_details_screen.dart';
import 'package:klaket_cine/presentation/shared/widgets/content_card.dart';
import 'package:klaket_cine/presentation/shared/widgets/section_header.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 350,
            floating: false,
            pinned: false,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: HeroSlider(items: dummyData),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TelegramPromoCard(),
                const SizedBox(height: 24),
                const SectionHeader(title: 'احدث الحلقات المضافة'),
                _buildRecentlyAddedList(context, recentlyAddedEpisodes),
                const SizedBox(height: 24),
                const SectionHeader(title: 'أعمال شاهدها أصدقاؤك'),
                _buildHorizontalMovieList(context, dummyData),
                const SizedBox(height: 24),
                const SectionHeader(title: 'حصرياً على كلاكت سينما'),
                _buildHorizontalMovieList(context, dummyData.reversed.toList()),
                const SizedBox(height: 24),
                const SectionHeader(title: 'أفضل 10 أعمال في مصر اليوم'),
                _buildHorizontalMovieList(context, dummyData),
                const SizedBox(height: 24),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRecentlyAddedList(
      BuildContext context, List<Map<String, dynamic>> episodes) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        scrollDirection: Axis.horizontal,
        itemCount: episodes.length,
        itemBuilder: (context, index) {
          final episode = episodes[index];
          return RecentEpisodeCard(
            episode: episode,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EpisodePlayerLoader(
                    episode: {
                      'image': episode['thumbnail'],
                      'seriesTitle': episode['series_title'],
                      'season': episode['season_number'],
                      'episode': episode['episode_number'],
                      'episodeTitle': episode['title'],
                      'video_servers': episode['video_servers'],
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildHorizontalMovieList(
      BuildContext context, List<Map<String, dynamic>> items) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ContentCard(
            item: item,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeriesDetailsScreen(item: item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
