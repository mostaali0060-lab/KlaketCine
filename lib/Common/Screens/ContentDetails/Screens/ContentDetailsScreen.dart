import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../Models/Season.dart';
import '../../../../Models/Series.dart';
import '../../../../Utils/Theme/AppColors.dart';
import '../../../Widgets/ContentDetailsHeaderSection.dart';
import '../../../Widgets/StorySection.dart';
import '../../../../Series/Widgets/SeasonsAndEpisodesSection.dart';
import '../../Details/Widgets/CastAndCrewSection.dart';
import '../../../../Home/Widgets/RecommendedSection.dart';
import 'package:share_plus/share_plus.dart';

class ContentDetailsScreen extends StatefulWidget {
  final clsSeries series;
  const ContentDetailsScreen({super.key, required this.series});

  @override
  State<ContentDetailsScreen> createState() => _ContentDetailsScreenState();
}

class _ContentDetailsScreenState extends State<ContentDetailsScreen> {
  clsSeason? _selectedSeason;
  final _seasonsKey = GlobalKey();
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    if (widget.series.Seasons.isNotEmpty) {
      _selectedSeason = widget.series.Seasons.first;
    }
  }

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
  Widget build(BuildContext context) {
    final isSeries = widget.series.Seasons.isNotEmpty;
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.background,
            pinned: true,
            expandedHeight: 250,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                label: const Text(
                  'الرجوع',
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                ),
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {
                  final String name = widget.series.Title;
                  final String shareText = 'Check out "$name" on KlaketCine!';
                  Share.share(shareText);
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Notifications enabled for this series.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_isFavorite ? 'Added to favorites.' : 'Removed from favorites.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.series.Poster,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/images/poster.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: Colors.black.withAlpha(25),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.0, 0.9],
                        colors: [
                          AppColors.background,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: Column(
                children: [
                  ContentDetailsHeaderSection(
                    series: widget.series,
                    isSeries: isSeries,
                    onWatchNowPressed: () {
                      if (isSeries) {
                        _scrollToSeasons();
                      } else {
                        // Movie watch logic
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  _buildSectionDivider(),
                  const SizedBox(height: 24),
                  StorySection(story: widget.series.Story),
                  const SizedBox(height: 24),
                  _buildSectionDivider(),
                  const SizedBox(height: 24),
                  CastAndCrewSection(series: widget.series),
                  const SizedBox(height: 24),
                  if (isSeries) ...[
                    _buildSectionDivider(),
                    const SizedBox(height: 24),
                    SeasonsAndEpisodes(
                      key: _seasonsKey,
                      series: widget.series,
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