// ignore_for_file: file_names
import 'package:klaket_cine/Data/SeriesDummyData.dart';
import 'package:klaket_cine/Models/Series.dart';

class Api {
  static Future<List<clsSeries>> GetSeries() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return SeriesDummyData.map((series) => clsSeries.fromMap(series)).toList();
  }
  static Future<clsSeries?> GetSeriesById(int id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final data = SeriesDummyData.firstWhere(
      (series) => series['ID'] == id,
      orElse: () => {},
    );
    if (data.isEmpty) return null;
    return clsSeries.fromMap(data);
  }
}
