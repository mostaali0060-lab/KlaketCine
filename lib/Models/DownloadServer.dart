class clsDownloadServer {
  final int ID;
  final String Quality;
  final String Url;
  final String Size;

  clsDownloadServer({
    required this.ID,
    required this.Quality,
    required this.Url,
    required this.Size,
  });

  // تحويل Map إلى clsDownloadServer
  factory clsDownloadServer.fromMap(Map<String, dynamic> map) {
    return clsDownloadServer(
      ID: map['id'] ?? 0,
      Quality: map['quality'] ?? '',
      Url: map['url'] ?? '',
      Size: map['size'] ?? '',
    );
  }
}