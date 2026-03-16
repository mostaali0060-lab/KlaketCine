class clsWatchServer {
  final int ID;
  final String Quality;
  final String Url;

  clsWatchServer({
    required this.ID,
    required this.Quality,
    required this.Url,
  });

  // تحويل Map إلى clsWatchServer
  factory clsWatchServer.fromMap(Map<String, dynamic> map) {
    return clsWatchServer(
      ID: map['id'] ?? 0,
      Quality: map['quality'] ?? '',
      Url: map['url'] ?? '',
    );
  }
}