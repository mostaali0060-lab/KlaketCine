import 'package:klaket_cine/Models/WatchServer.dart';
import 'package:klaket_cine/Models/DownloadServer.dart';

class clsEpisode {
  final int ID;
  final int EpisodeNumber;
  final String Title;
  final String Duration;
  final String Thumbnail;
  final List<clsWatchServer> WatchServers;
  final List<clsDownloadServer> DownloadServers;

  clsEpisode({
    required this.ID,
    required this.EpisodeNumber,
    required this.Title,
    required this.Duration,
    required this.Thumbnail,
    required this.WatchServers,
    required this.DownloadServers,
  });

  // Factory method لتحويل Map إلى clsEpisode
  factory clsEpisode.fromMap(Map<String, dynamic> map) {
    return clsEpisode(
      ID: map['ID'] ?? 0,
      EpisodeNumber: map['EpisodeNumber'] ?? 0, 
      Title: map['Title'] ?? '',
      Duration: map['Duration']?.toString() ?? '',
      Thumbnail: map['Thumbnail'] ?? '',
      WatchServers: (map['WatchServers'] as List<dynamic>? ?? [])
          .map((w) => clsWatchServer.fromMap(w))
          .toList(),
      DownloadServers: (map['DownloadServers'] as List<dynamic>? ?? [])
          .map((d) => clsDownloadServer.fromMap(d))
          .toList(),
    );
  }
}