import 'package:flutter/material.dart';
import '../Core/Constants/AppColors.dart';
import '../Data/DummyData.dart';
import '../Widgets/Shared/MovieCard.dart';
import 'SeriesDetailsScreen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // For demo purposes, we take a subset of moviesList
    final List<Map<String, dynamic>> favoriteMovies = DummyData.moviesList.take(3).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('المفضلة', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: favoriteMovies.isEmpty
          ? _buildEmptyState()
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: favoriteMovies.length,
              itemBuilder: (context, index) {
                final movie = favoriteMovies[index];
                return Stack(
                  children: [
                    MovieCard(
                      movie: movie,
                      width: double.infinity,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeriesDetailsScreen(item: movie),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: 4,
                      left: 14,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColors.background.withOpacity(0.8),
                        child: const Icon(
                          Icons.favorite,
                          color: AppColors.primary,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: AppColors.textSecondary),
          SizedBox(height: 16),
          Text(
            'لا توجد عناصر في المفضلة',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'أضف الأفلام والمسلسلات لمشاهدتها لاحقاً',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
