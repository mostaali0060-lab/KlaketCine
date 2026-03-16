import 'package:flutter/material.dart';
import 'package:klaket_cine/Common/Screens/ContentDetails/Screens/ContentDetailsScreen.dart';
import 'package:klaket_cine/Common/Widgets/ContentCard.dart';
import 'package:klaket_cine/Common/Widgets/SectionHeader.dart';
import 'package:klaket_cine/Models/Series.dart';

class ContentRowSection extends StatelessWidget {
  final String title;
  final List<clsSeries> items;

  const ContentRowSection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 250, // Increased height to fit the card
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final seriesItem = items[index];
              return ContentCard(
                Series: seriesItem,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContentDetailsScreen(
                        series: seriesItem,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}