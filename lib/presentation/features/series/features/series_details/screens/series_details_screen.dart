import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';
import 'package:klaket_cine/data/dummy_data.dart';
import 'package:klaket_cine/presentation/features/series/features/series_details/widgets/seasons_and_episodes.dart';
import 'package:klaket_cine/presentation/features/series/features/series_details/widgets/series_details_header.dart';
import 'package:klaket_cine/presentation/features/series/features/series_details/widgets/similar_section.dart';
import 'package:klaket_cine/presentation/shared/widgets/cast_crew_section.dart';
import 'package:klaket_cine/presentation/shared/widgets/story_section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class SeriesDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> item;

  const SeriesDetailsScreen({super.key, required this.item});

  @override
  State<SeriesDetailsScreen> createState() => _SeriesDetailsScreenState();
}

class _SeriesDetailsScreenState extends State<SeriesDetailsScreen> {
  late Map<String, dynamic> _selectedSeason;
  final _seasonsKey = GlobalKey();
  bool _isFavorite = false;


  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
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
  void initState() {
    super.initState();
    if (widget.item['type'] == 'series') {
      _selectedSeason = seasonsData.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> details = {
      ...widget.item,
      'story':
          'تدور أحداث المسلسل في إطار الدراما الصعيدية، حيث يواجه رجل أعمال صعوبات في تحقيق حلمه ببناء فندق في قريته، ويخوض صراعات مع منافسيه ومع عائلته، وتتوالى الأحداث في إطار من التشويق والإثارة. المسلسل من بطولة نخبة من نجوم الدراما المصرية والعربية، ويقدم رؤية جديدة للصعيد المصري بعيدًا عن الصورة النمطية المعتادة. يركز العمل على العلاقات الإنسانية المتشابكة والصراعات بين الخير والشر، ويسلط الضوء على قضايا اجتماعية هامة مثل الثأر والتطرف الديني.'
    };
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
            backgroundColor: AppColors.background,
            pinned: true, // Keeps the app bar visible during scroll
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
            // Add the new icons to the 'actions' list
            // In RTL, actions are on the left side.
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {
                   final String name = details['name'] ?? 'Check out this cool movie/series!';
                  final String shareText = 'Check out "$name" on KlaketCine!';
                  Share.share(shareText);
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined,
                    color: Colors.white),
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
                      duration: const Duration(seconds: 2),
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
                    details['cover'] ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/poster.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: const [0.0, 0.9],
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: Column(
                children: [
                  SeriesDetailsHeader(
                      details: details,
                      isSeries: isSeries,
                      episodesCount: episodesCount,
                      onWatchNowPressed: () {
                        if (isSeries) {
                          _scrollToSeasons();
                        } else {
                          final videoServers = (details['video_servers'] as List?)
                              ?.map((s) => s as Map<String, dynamic>)
                              .toList();
                          if (videoServers != null && videoServers.isNotEmpty) {
                            _showServersBottomSheet(context, 'سيرفرات المشاهدة',
                                videoServers, false);
                          }
                        }
                      }),
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

  void _showServersBottomSheet(BuildContext context, String title,
      List<Map<String, dynamic>> servers, bool isDownload) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1C21), // Dark surface color
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 28),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: servers.length,
                itemBuilder: (context, index) {
                  final server = servers[index];
                  final quality = server['name'] ?? server['quality'];
                  final size = server['size'];
                  final url = server['url'];

                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      if (url != null) {
                        _launchURL(url);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF282A30), // Item background
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          if (isDownload && size != null)
                            Text(
                              size,
                              style: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 15),
                            ),
                          const Spacer(),
                          Text(
                            quality,
                            style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
