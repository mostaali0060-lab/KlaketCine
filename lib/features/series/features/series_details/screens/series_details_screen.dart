import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';
import 'package:klaket_cine/data/dummy_data.dart';
import 'package:klaket_cine/features/series/features/series_details/widgets/seasons_and_episodes.dart';
import 'package:klaket_cine/features/series/features/series_details/widgets/series_details_header.dart';
import 'package:klaket_cine/features/series/features/series_details/widgets/similar_section.dart';
import 'package:klaket_cine/shared/widgets/cast_crew_section.dart';
import 'package:klaket_cine/shared/widgets/story_section.dart';

class SeriesDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> item;

  const SeriesDetailsScreen({super.key, required this.item});

  @override
  State<SeriesDetailsScreen> createState() => _SeriesDetailsScreenState();
}

class _SeriesDetailsScreenState extends State<SeriesDetailsScreen> {
  late Map<String, dynamic> _selectedSeason;
  final _seasonsKey = GlobalKey();

  void _scrollToSeasons() {
    if (_seasonsKey.currentContext != null) {
      Scrollable.ensureVisible(
        _seasonsKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.item['type'] == 'series') {
      _selectedSeason = seasonsData.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> details = widget.item;
    if (!details.containsKey('cover') && details.containsKey('poster')) {
      details['cover'] = details['poster'];
    }
    final isSeries = details['type'] == 'series';
    final int? episodesCount =
        isSeries ? _selectedSeason['episodes_count'] : null;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 0,
            backgroundColor: AppColors.background,
            pinned: true,
            // title: Text(
            //   widget.item['title'] ?? 'تفاصيل',
            //   style: const TextStyle(
            //       color: Colors.white,
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold),
            // ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(color: AppColors.background),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: Column(
                children: [
                  SeriesDetailsHeader(
                      details: details,
                      isSeries: isSeries,
                      episodesCount: episodesCount,
                      onWatchNowPressed: _scrollToSeasons),
                  const SizedBox(height: 24),
                  _buildSectionDivider(),
                  const SizedBox(height: 24),
                  StorySection(details: details),
                  const SizedBox(height: 24),
                  _buildSectionDivider(),
                  const SizedBox(height: 24),
                  const CastCrewSection(title: 'الممثلين', members: castData),
                  const SizedBox(height: 24),
                  _buildSectionDivider(),
                  const SizedBox(height: 24),
                  const CastCrewSection(title: 'فريق العمل', members: crewData),
                  const SizedBox(height: 24),
                  if (isSeries) ...[
                    _buildSectionDivider(),
                    const SizedBox(height: 24),
                    SeasonsAndEpisodes(
                      key: _seasonsKey,
                      seriesDetails: details,
                      selectedSeason: _selectedSeason,
                      onSeasonSelected: (season) {
                        setState(() {
                          _selectedSeason = season;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                  _buildSectionDivider(),
                  const SizedBox(height: 24),
                  const SimilarSection(),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionDivider() {
    return const Divider(color: Color(0xFF282A30), height: 1, thickness: 1);
  }
}
