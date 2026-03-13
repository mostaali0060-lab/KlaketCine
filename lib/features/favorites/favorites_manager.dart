class FavoritesManager {
  static final List<Map<String, dynamic>> _favoriteItems = [];

  static List<Map<String, dynamic>> get favorites => _favoriteItems;

  static void add(Map<String, dynamic> item) {
    if (!isFavorite(item)) {
      _favoriteItems.add(item);
    }
  }

  static void remove(Map<String, dynamic> item) {
    _favoriteItems.removeWhere((favItem) => favItem['id'] == item['id']);
  }

  static bool isFavorite(Map<String, dynamic> item) {
    return _favoriteItems.any((favItem) => favItem['id'] == item['id']);
  }

  static void toggleFavorite(Map<String, dynamic> item) {
    if (isFavorite(item)) {
      remove(item);
    } else {
      add(item);
    }
  }
}
