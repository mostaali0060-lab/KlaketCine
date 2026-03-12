import 'package:flutter/material.dart';
import '../Core/Constants/AppColors.dart';
import '../Data/DummyData.dart';
import '../Widgets/Home/HeroSlider.dart';
import '../Widgets/Home/TelegramPromoCard.dart';
import '../Widgets/Shared/MovieCard.dart';
import '../Widgets/Shared/SectionHeader.dart';
import 'SeriesDetailsScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.movie_filter, color: AppColors.primary, size: 28),
            const SizedBox(width: 8),
            Text(
              'كلاكيت سينما',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.notifications_none, color: Colors.white),
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.favorite_border, color: Colors.white),
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeroSlider(),
            const SizedBox(height: 16),
            _buildCategories(),
            const SizedBox(height: 16),
            const TelegramPromoCard(),
            const SizedBox(height: 16),
            _buildMovieSection(context, 'أفلام مميزة', DummyData.moviesList),
            _buildMovieSection(context, 'مسلسلات رمضان', DummyData.moviesList.reversed.toList()),
            _buildMovieSection(context, 'الأكثر مشاهدة', DummyData.moviesList),
            _buildMovieSection(context, 'WatchNow حصري', DummyData.moviesList.reversed.toList()),
            _buildMovieSection(context, 'وصل حديثاً', DummyData.moviesList),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: DummyData.categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            margin: const EdgeInsets.only(left: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.textSecondary.withOpacity(0.3),
              ),
            ),
            child: Center(
              child: Text(
                DummyData.categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMovieSection(BuildContext context, String title, List<Map<String, dynamic>> movies) {
    return Column(
      children: [
        SectionHeader(
          title: title,
          onSeeAll: () {},
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieCard(
                movie: movies[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeriesDetailsScreen(item: movies[index]),
                    ),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
