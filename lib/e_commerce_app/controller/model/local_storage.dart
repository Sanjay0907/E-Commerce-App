import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<bool> addFavorite(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String _id = id.toString();
    List<String> favorite = sharedPreferences.getStringList('favorites') ?? [];
    favorite.add(_id);
    return await sharedPreferences.setStringList('favorites', favorite);
  }

  static Future<bool> removeFavorite(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String _id = id.toString();
    List<String> favorite = sharedPreferences.getStringList('favorites') ?? [];
    favorite.remove(_id);
    return await sharedPreferences.setStringList('favorites', favorite);
  }

  static Future<List<int>> fetchFavorite() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> fav = sharedPreferences.getStringList('favorites') ?? [];
    List<int> favoriteList = fav.map((e) => int.parse(e)).toList();
    return favoriteList;
  }
}
