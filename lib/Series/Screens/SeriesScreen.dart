import 'package:flutter/material.dart';
import '../../Data/SeriesDummyData.dart';
import '../../Common/Widgets/ContentCard.dart';
import '../../Common/Screens/ContentDetails/Screens/ContentDetailsScreen.dart';
import '../../Models/Series.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<clsSeries> seriesList = SeriesDummyData.map((data) => clsSeries.fromMap(data)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('المسلسلات', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF0F1014),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: seriesList.length,
        itemBuilder: (context, index) {
          final seriesItem = seriesList[index];
          return ContentCard(
            Series: seriesItem,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContentDetailsScreen(series: seriesItem),
                ),
              );
            },
          );
        },
      ),
    );
  }
}