import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';
import 'package:klaket_cine/data/dummy_data.dart';
import 'package:klaket_cine/presentation/features/episode/screens/episode_details_screen.dart';

class SeasonsAndEpisodes extends StatefulWidget {
  final Map<String, dynamic> seriesDetails;
  final Map<String, dynamic> selectedSeason;
  final Function(Map<String, dynamic>) onSeasonSelected;

  const SeasonsAndEpisodes({
    super.key,
    required this.seriesDetails,
    required this.selectedSeason,
    required this.onSeasonSelected,
  });

  @override
  State<SeasonsAndEpisodes> createState() => _SeasonsAndEpisodesState();
}

class _SeasonsAndEpisodesState extends State<SeasonsAndEpisodes> {
  int? _currentlyPlayingEpisode;

  String _getSeasonName(int seasonNumber) {
    switch (seasonNumber) {
      case 1:
        return 'الموسم الاول';
      case 2:
        return 'الموسم الثاني';
      case 3:
        return 'الموسم الثالث';
      case 4:
        return 'الموسم الرابع';
      case 5:
        return 'الموسم الخامس';
      case 6:
        return 'الموسم السادس';
      case 7:
        return 'الموسم السابع';
      case 8:
        return 'الموسم الثامن';
      case 9:
        return 'الموسم التاسع';
      case 10:
        return 'الموسم العاشر';
      default:
        return 'الموسم $seasonNumber';
    }
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
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('اختر الموسم',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
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
                            widget.selectedSeason['season_number'];
                        return InkWell(
                          onTap: () {
                            widget.onSeasonSelected(season);
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
                                      '${_getSeasonName(season["season_number"] as int)} [ ${season["season_number"]} ]',
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
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                if (isSelected)
                                  const Icon(Icons.check_circle_rounded,
                                      color: AppColors.primary, size: 26),
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

  @override
  Widget build(BuildContext context) {
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
                  '${_getSeasonName(widget.selectedSeason["season_number"] as int)} [ ${widget.selectedSeason["season_number"]} ]',
                  style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
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
          itemCount: (widget.selectedSeason['episodes'] as List).length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 80,
            childAspectRatio: 1.0,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final episode = (widget.selectedSeason['episodes'] as List)[index];
            final bool isPlaying =
                _currentlyPlayingEpisode == episode['episode_number'];
            return InkWell(
              onTap: () {
                setState(() {
                  _currentlyPlayingEpisode = episode['episode_number'];
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EpisodeDetailsScreen(
                      seriesDetails: widget.seriesDetails,
                      selectedSeason: widget.selectedSeason,
                      episode: episode,
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: BoxDecoration(
                  color: isPlaying
                      ? AppColors.primary.withAlpha(51)
                      : AppColors.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: isPlaying
                      ? Border.all(color: AppColors.primary, width: 2)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('الحلقة',
                        style: TextStyle(
                            color: AppColors.textSecondary, fontSize: 12)),
                    const SizedBox(height: 4),
                    Text(
                      episode['episode_number'].toString(),
                      style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
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
