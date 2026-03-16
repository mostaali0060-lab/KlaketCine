import 'package:flutter/material.dart';
import 'package:klaket_cine/Models/Series.dart';
import 'package:klaket_cine/Services/Api.dart';
import 'package:klaket_cine/Home/Widgets/TrendingSliderSection.dart';
import 'package:klaket_cine/Home/Widgets/TelegramPromoSection.dart';
import 'package:klaket_cine/Common/Widgets/ContentRowSection.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<clsSeries>> _seriesFuture;

  @override
  void initState() {
    super.initState();
    _seriesFuture = Api.GetSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FutureBuilder<List<clsSeries>>(
              future: _seriesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 500,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return SizedBox(
                    height: 500,
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  );
                } else if (snapshot.hasData) {
                  return TrendingSliderSection(items: snapshot.data!);
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TelegramPromoSection(),
                const SizedBox(height: 24),
                FutureBuilder<List<clsSeries>>(
                  future: _seriesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      return ContentRowSection(
                        title: 'أعمال شاهدها أصدقاؤك',
                        items: snapshot.data!,
                      );
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                ),
                const SizedBox(height: 24),
                 FutureBuilder<List<clsSeries>>(
                  future: _seriesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      return ContentRowSection(
                        title: 'حصرياً على كلاكت سينما',
                        items: snapshot.data!.reversed.toList(),
                      );
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                ),
                const SizedBox(height: 24),
                 FutureBuilder<List<clsSeries>>(
                  future: _seriesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      return ContentRowSection(
                        title: 'أفضل 10 أعمال في مصر اليوم',
                        items: snapshot.data!,
                      );
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          )
        ],
      ),
    );
  }
}