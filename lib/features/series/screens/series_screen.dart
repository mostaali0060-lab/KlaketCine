import 'package:flutter/material.dart';
import 'package:klaket_cine/data/dummy_data.dart';
import 'package:klaket_cine/shared/widgets/content_card.dart';
import 'package:klaket_cine/features/series/screens/series_details_screen.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final series = dummyData.where((item) => item['type'] == 'series').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('المسلسلات', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
        ],
      ),
      body: ListView.builder(
        itemCount: series.length,
        itemBuilder: (context, index) {
          final item = series[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ContentCard(
              item: item,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeriesDetailsScreen(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
