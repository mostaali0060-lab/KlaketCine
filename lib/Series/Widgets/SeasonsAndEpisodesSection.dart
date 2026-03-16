import 'package:flutter/material.dart';
import 'package:klaket_cine/Models/Season.dart';
import 'package:klaket_cine/Models/Series.dart';
import 'package:klaket_cine/Utils/Theme/AppColors.dart';
import '../../Common/Screens/WatchAndDownload/Screens/WatchAndDownloadScreen.dart';

class SeasonsAndEpisodes extends StatefulWidget {
  final clsSeries series;
  final clsSeason? selectedSeason;
  final Function(clsSeason) onSeasonSelected;

  const SeasonsAndEpisodes({
    super.key,
    required this.series,
    required this.selectedSeason,
    required this.onSeasonSelected,
  });

  @override
  State<SeasonsAndEpisodes> createState() => _SeasonsAndEpisodesState();
}

class _SeasonsAndEpisodesState extends State<SeasonsAndEpisodes> {
  int? _currentlyPlayingEpisodeNumber;

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
                    topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
                          icon: const Icon(Icons.close, color: Colors.white, size: 28),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: widget.series.Seasons.length,
                      itemBuilder: (context, index) {
                        final season = widget.series.Seasons[index];
                        final bool isSelected = season.SeasonNumber == widget.selectedSeason?.SeasonNumber;

                        return InkWell(
                          onTap: () {
                            widget.onSeasonSelected(season);
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.primary.withAlpha(51) : AppColors.surface,
                              borderRadius: BorderRadius.circular(12),
                              border: isSelected ? Border.all(color: AppColors.primary, width: 2) : Border.all(color: Colors.transparent, width: 2),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'الموسم ${season.SeasonNumber}',
                                      style: TextStyle(
                                        color: isSelected ? AppColors.primary : Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${season.Episodes.length} حلقة',
                                      style: TextStyle(
                                          color: isSelected ? AppColors.primary.withAlpha(180) : AppColors.textSecondary, 
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                if (isSelected)
                                  const Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 26),
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
    if (widget.selectedSeason == null) {
      return const SizedBox.shrink();
    }
    
    final episodes = widget.selectedSeason!.Episodes;

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
                  'الموسم ${widget.selectedSeason!.SeasonNumber}',
                  style: const TextStyle(
                      color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textSecondary, size: 24),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: episodes.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 80,
            childAspectRatio: 1.0,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final episode = episodes[index];
            final bool isPlaying = episode.EpisodeNumber == _currentlyPlayingEpisodeNumber;
            return InkWell(
              onTap: () {
                setState(() {
                  _currentlyPlayingEpisodeNumber = episode.EpisodeNumber;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WatchAndDownloadScreen(
                      series: widget.series,
                      season: widget.selectedSeason!,
                      episode: episode,
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: BoxDecoration(
                  color: isPlaying ? AppColors.primary.withAlpha(51) : AppColors.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: isPlaying ? Border.all(color: AppColors.primary, width: 2) : Border.all(color: Colors.transparent, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'الحلقة',
                      style: TextStyle(
                        color: isPlaying ? AppColors.primary : AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      episode.EpisodeNumber.toString(),
                      style: TextStyle(
                        color: isPlaying ? AppColors.primary : AppColors.textPrimary,
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

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(width: 4, height: 20, color: AppColors.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}