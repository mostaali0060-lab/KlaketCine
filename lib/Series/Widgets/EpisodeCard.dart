import 'package:flutter/material.dart';
import 'package:flutter/Common/Screens/WatchAndDownload/Screens/WatchAndDownloadScreen.dart';

class EpisodeCard extends StatelessWidget {
  final Map<String, dynamic> episode;
  final String seriesTitle;
  final int seasonNumber;

  const EpisodeCard({
    super.key,
    required this.episode,
    required this.seriesTitle,
    required this.seasonNumber,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EpisodeScreen(
              episode: {
                'image': episode['thumbnail'] ?? '',
                'seriesTitle': seriesTitle,
                'season': seasonNumber,
                'episode': episode['episode_number'],
                'episodeTitle': episode['title']
              },
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 140,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(episode['thumbnail'] ?? ''),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) => {},
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_outline,
                  color: Colors.white70,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الحلقة ${episode["episode_number"]}: ${episode["title"]}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    episode['description'],
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
