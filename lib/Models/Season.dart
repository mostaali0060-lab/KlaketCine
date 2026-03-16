import 'package:klaket_cine/Models/Episode.dart';

class clsSeason {
  final int ID;
  final int SeasonNumber;
  final int EpisodesCount;
  final List<clsEpisode> Episodes;

  clsSeason({
    required this.ID,
    required this.SeasonNumber,
    required this.Episodes,
  }) : EpisodesCount = Episodes.length; // العدد مشتق من قائمة الحلقات

  // تحويل Map إلى clsSeason
  factory clsSeason.fromMap(Map<String, dynamic> map) {
    final episodesList = (map['Episodes'] as List<dynamic>? ?? [])
        .map((e) => clsEpisode.fromMap(e))
        .toList();

    return clsSeason(
      ID: map['id'] ?? 0,
      SeasonNumber: map['SeasonNumber'] ?? 0,
      Episodes: episodesList,
    );
  }
}