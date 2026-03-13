import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';
import 'package:klaket_cine/data/dummy_data.dart';

const seasonsData = [
  {
    "season_number": 1,
    "episodes_count": 20,
    "episodes": [
      {"episode_number": 1, "title": "بدايات جديدة", "description": "بعد حادث مأساوي، يضطر البطل إلى تغيير مسار حياته والبدء من جديد في مدينة غريبة.", "thumbnail": "https://image.tmdb.org/t/p/w500/gg2WdefC0G241aA8sS5M848gqf.jpg"},
      {"episode_number": 2, "title": "أسرار الماضي", "description": "يظهر شخص من ماضي البطل، مهدداً بكشف أسرار قد تدمر كل ما بناه.", "thumbnail": "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg"},
      {"episode_number": 3, "title": "الحلقة 3", "description": "وصف الحلقة.", "thumbnail": "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg"},
      {"episode_number": 4, "title": "الحلقة 4", "description": "وصف الحلقة.", "thumbnail": "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg"},
      {"episode_number": 5, "title": "الحلقة 5", "description": "وصف الحلقة.", "thumbnail": "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg"},
      {"episode_number": 6, "title": "الحلقة 6", "description": "وصف الحلقة.", "thumbnail": "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg"},
      {"episode_number": 7, "title": "الحلقة 7", "description": "وصف الحلقة.", "thumbnail": "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg"},
      {"episode_number": 8, "title": "الحلقة 8", "description": "وصف الحلقة.", "thumbnail": "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg"},
      {"episode_number": 9, "title": "الحلقة 9", "description": "وصف الحلقة.", "thumbnail": "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg"},
      {"episode_number": 10, "title": "الحلقة 10", "description": "وصف الحلقة.", "thumbnail": "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg"},
    ]
  },
  {
    "season_number": 2,
    "episodes_count": 30,
    "episodes": [
      {"episode_number": 1, "title": "عودة غير متوقعة", "description": "تبدأ أحداث الموسم الثاني بعودة شخصية رئيسية كان يُعتقد أنها اختفت إلى الأبد.", "thumbnail": "https://image.tmdb.org/t/p/w500/6LWy0jv3v3A3Jm2tL3P1h492gOJ.jpg"},
    ]
  },
];

class SeriesDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> item;

  const SeriesDetailsScreen({super.key, required this.item});

  @override
  State<SeriesDetailsScreen> createState() => _SeriesDetailsScreenState();
}

class _SeriesDetailsScreenState extends State<SeriesDetailsScreen> {
  late Map<String, dynamic> _selectedSeason;

  @override
  void initState() {
    super.initState();
    if (widget.item['type'] == 'series') {
      _selectedSeason = seasonsData.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> details =
        Map<String, dynamic>.from(dummyData.first);
    details.addAll(widget.item);
    if (widget.item.containsKey('poster')) {
      details['cover'] = widget.item['poster'];
    }
    final isSeries = widget.item['type'] == 'series';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 0,
            backgroundColor: AppColors.background,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(color: AppColors.background),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: Column(
                children: [
                  _buildResponsiveTopInfo(context, details, isSeries),
                  const SizedBox(height: 24),
                  _buildSectionDivider(),
                  const SizedBox(height: 24),
                  _buildStorySection(details),
                  const SizedBox(height: 24),
                  if (isSeries) ...[
                    _buildSectionDivider(),
                    const SizedBox(height: 24),
                    _buildSeasonsAndEpisodes(context, details),
                    const SizedBox(height: 24),
                  ],
                  _buildSectionDivider(),
                  const SizedBox(height: 24),
                  _buildSimilarSection(context),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSeasonSelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.4,
          maxChildSize: 0.8,
          builder: (_, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1A1C21),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'اختر الموسم',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close,
                              color: Colors.white, size: 28),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: seasonsData.length,
                      itemBuilder: (context, index) {
                        final season = seasonsData[index];
                        final bool isSelected = season['season_number'] ==
                            _selectedSeason['season_number'];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _selectedSeason = season;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF282A30),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'الموسم ${season["season_number"]}',
                                      style: TextStyle(
                                        color: isSelected
                                            ? AppColors.primary
                                            : Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${season["episodes_count"]} حلقة',
                                      style: const TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check_circle_rounded,
                                    color: AppColors.primary,
                                    size: 26,
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSeasonsAndEpisodes(
      BuildContext context, Map<String, dynamic> seriesDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('الحلقات'),
        const SizedBox(height: 16),
        InkWell(
          onTap: () => _showSeasonSelectionSheet(context),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الموسم ${_selectedSeason["season_number"]}',
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded,
                    color: AppColors.textSecondary, size: 24),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: (_selectedSeason['episodes'] as List).length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            final episode = (_selectedSeason['episodes'] as List)[index];
            return InkWell(
              onTap: () {
                print('Tapped on episode ${episode['episode_number']}');
              },
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'الحلقة',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      episode['episode_number'].toString(),
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildResponsiveTopInfo(
      BuildContext context, Map<String, dynamic> details, bool isSeries) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return _buildTopInfoColumn(context, details, isSeries);
        } else {
          return _buildTopInfoRow(context, details, isSeries);
        }
      },
    );
  }

  Widget _buildTopInfoRow(BuildContext context, Map<String, dynamic> details, bool isSeries) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.45;
    final imageWidth = imageHeight / 1.5;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child:
              _buildDetailsColumn(context, details, CrossAxisAlignment.start, isSeries),
        ),
        const SizedBox(width: 24),
        Expanded(
          flex: 2,
          child: _buildPosterImage(
              context, details['cover'] ?? '', imageWidth, imageHeight),
        ),
      ],
    );
  }

  Widget _buildTopInfoColumn(
      BuildContext context, Map<String, dynamic> details, bool isSeries) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * 0.5;
    final imageHeight = imageWidth * 1.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildPosterImage(
            context, details['cover'] ?? '', imageWidth, imageHeight),
        const SizedBox(height: 24),
        _buildDetailsColumn(context, details, CrossAxisAlignment.center, isSeries),
      ],
    );
  }

  Widget _buildPosterImage(
      BuildContext context, String posterUrl, double width, double height) {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          posterUrl,
          width: width,
          height: height,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            width: width,
            height: height,
            color: AppColors.surface,
            child: const Icon(Icons.broken_image,
                color: AppColors.textSecondary, size: 40),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsColumn(BuildContext context, Map<String, dynamic> details,
      CrossAxisAlignment crossAxisAlignment, bool isSeries) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          details['title'],
          textAlign: crossAxisAlignment == CrossAxisAlignment.center
              ? TextAlign.center
              : TextAlign.start,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(details['year'] ?? '2023',
                style: const TextStyle(
                    color: AppColors.textSecondary, fontSize: 14)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('•',
                  style:
                      TextStyle(color: AppColors.textSecondary, fontSize: 12)),
            ),
            const Icon(Icons.star, color: AppColors.ratingStar, size: 18),
            const SizedBox(width: 4),
            Text(
              (details['rating'] ?? 'N/A').toString(),
              style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            if (details['badge'] != null && details['badge'].isNotEmpty) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('•',
                    style:
                        TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              ),
              _buildBadge(details['badge'],
                  AppColors.badgeGreen.withOpacity(0.8), Colors.white,
                  fontSize: 11),
            ]
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: crossAxisAlignment == CrossAxisAlignment.center
              ? WrapAlignment.center
              : WrapAlignment.start,
          children: [
            _buildBadge(details['genre'] ?? 'متنوع', AppColors.surface,
                AppColors.textPrimary),
            if (isSeries)
              _buildBadge('${details['episodes_count']} حلقة', AppColors.surface,
                  AppColors.textPrimary),
            _buildBadge(details['country'] ?? 'غير معروف', AppColors.surface,
                AppColors.textPrimary),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow_rounded, size: 30),
              label: const Text('تشغيل',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.favorite_border_rounded,
                  color: AppColors.textPrimary, size: 30),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(String text, Color bgColor, Color textColor,
      {double fontSize = 12}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSectionDivider() {
    return const Divider(color: Color(0xFF282A30), height: 1, thickness: 1);
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          color: AppColors.primary,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildStorySection(Map<String, dynamic> details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('القصة'),
        const SizedBox(height: 16),
        Text(
          details['story'] ?? "لا تتوفر حاليا قصة",
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 15,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildSimilarSection(BuildContext context) {
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
            itemCount: dummyData.length,
            itemBuilder: (context, index) {
              final item = dummyData[index];
              final String posterUrl = item['poster'] ?? '';
              String title =
                  item['title']?.replaceFirst('فيلم ', '').replaceFirst('مسلسل ', '') ?? '';

              return Container(
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
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.9)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [0.5, 1.0],
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
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
