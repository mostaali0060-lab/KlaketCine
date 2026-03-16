import 'package:klaket_cine/Models/Season.dart';
import 'package:klaket_cine/Models/Episode.dart';
import 'package:klaket_cine/Models/CastMember.dart';

class clsSeries {
  final int ID;
  final String Title;
  final String Poster;
  final String Story;
  final String Label;
  final double Rating;
  final int Views;
  final int CommentsCount;
  final List<clsSeason> Seasons;
  final List<clsEpisode> Episodes;
  final List<clsCastMember> Cast;
  final List<clsCastMember> Crew;

  clsSeries({
    required this.ID,
    required this.Title,
    required this.Poster,
    required this.Story,
    required this.Label,
    required this.Rating,
    required this.Views,
    required this.CommentsCount,
    required this.Seasons,
    required this.Episodes,
    required this.Cast,
    required this.Crew,
  });

  factory clsSeries.fromMap(Map<String, dynamic> map) {
    return clsSeries(
      ID: map['ID'] ?? 0,
      Title: map['Title'] ?? '',
      Poster: map['Poster'] ?? '',
      Story: map['Story'] ?? '',
      Label: map['Label'] ?? '',
      // معالجة آمنة لتحويل الرقم إلى double
      Rating: double.tryParse(map['Rating']?.toString() ?? '0.0') ?? 0.0,
      Views: map['Views'] ?? 0,
      CommentsCount: map['CommentsCount'] ?? 0,
      Seasons: (map['Seasons'] as List?)
              ?.map((s) => clsSeason.fromMap(s))
              .toList() ??
          [],
      Episodes: (map['Episodes'] as List?)
              ?.map((e) => clsEpisode.fromMap(e))
              .toList() ??
          [],
      Cast: (map['Cast'] as List?)
              ?.map((e) => clsCastMember.fromMap(e))
              .toList() ??
          [],
      Crew:
          (map['Crew'] as List?) // تأكد أن المفتاح في الـ JSON هو 'Croe' فعلاً
                  ?.map((e) => clsCastMember.fromMap(e))
                  .toList() ??
              [],
    );
  }
}
