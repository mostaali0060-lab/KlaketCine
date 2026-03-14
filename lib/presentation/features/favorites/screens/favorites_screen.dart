import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';
import 'package:klaket_cine/presentation/features/series/features/series_details/screens/series_details_screen.dart';
import 'package:klaket_cine/presentation/shared/widgets/content_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Map<String, dynamic>> _favoriteMovies = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    setState(() {
      // FavoritesManager is not implemented, so we'll just use an empty list for now.
      _favoriteMovies = [];
    });
  }

  void _navigateToDetails(Map<String, dynamic> item) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SeriesDetailsScreen(item: item),
      ),
    );
    _loadFavorites(); // Refresh the list when returning
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المفضلة', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: _favoriteMovies.isEmpty
          ? _buildEmptyState()
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _favoriteMovies.length,
              itemBuilder: (context, index) {
                final movie = _favoriteMovies[index];
                return Stack(
                  children: [
                    ContentCard(
                      item: movie,
                      onTap: () => _navigateToDetails(movie),
                    ),
                    Positioned(
                      top: 4,
                      left: 14,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColors.background.withAlpha(204),
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
