import 'package:flutter/material.dart';
import 'package:klaket_cine/Utils/Theme/AppColors.dart';
import '../../Data/SeriesDummyData.dart';
import '../../Models/Series.dart';
import '../../Common/Screens/ContentDetails/Screens/ContentDetailsScreen.dart';

class SimilarSection extends StatelessWidget {
  const SimilarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<clsSeries> seriesList = SeriesDummyData.map((data) => clsSeries.fromMap(data)).toList();
    final screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = screenWidth / 3.8;
    final double cardHeight = cardWidth * 1.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('قد يعجبك أيضاً'),
        const SizedBox(height: 16),
        SizedBox(
          height: cardHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: seriesList.length,
            itemBuilder: (context, index) {
              final item = seriesList[index];
              final String posterUrl = item.Poster;
              String title = item.Title
                      .replaceFirst('فيلم ', '')
                      .replaceFirst('مسلسل ', '');

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContentDetailsScreen(series: item),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  width: cardWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          posterUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: AppColors.surface,
                            child: const Icon(Icons.broken_image,
                                color: AppColors.textSecondary, size: 40),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Color.fromRGBO(0, 0, 0, 0.9)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.5, 1.0],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 4,
                          right: 4,
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(width: 4, height: 20, color: AppColors.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}