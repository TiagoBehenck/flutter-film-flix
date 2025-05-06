import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:filme_flix/models/movie.dart';

class Storage {  
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> save({
    required String key,
    required List<Movie> movies,
  }) async {
    final jsonList = movies.map((movie) => jsonEncode(movie.toJson())).toList();
    await _prefs.setStringList(key, jsonList);
  }

  Future<List<Movie>> get({
    required String key,
  }) async {
    try {
      final data = _prefs.getStringList(key);

      if (data != null) {
        return data.map((movie) => Movie.fromJson(jsonDecode(movie))).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to load movies from storage: $e');
    }
  }

  Future<void> remove({required String key}) async {
    await _prefs.remove(key);
  }

  bool hasKey({required String key}) {
    return _prefs.containsKey(key);
  }

  Future<void> saveTimestamp({required String key, required int timestamp}) async {
    final timeKey = '${key}_time';
    await _prefs.setInt(timeKey, timestamp);
  }

  int getTimestamp({required String key}) {
    final timeKey = '${key}_time';
    return _prefs.getInt(timeKey) ?? 0;
  }

  Future<void> removeTimestamp({required String key}) async {
    final timeKey = '${key}_time';
    await _prefs.remove(timeKey);
  }

  Future<void> removeByPrefix({required String prefix}) async {
    final keys = _prefs.getKeys();
    
    for (final key in keys) {
      if (key.startsWith(prefix)) {
        await _prefs.remove(key);
      }
    }
  }

  Set<String> getKeys() {
    return _prefs.getKeys();
  }

  Future<bool> clearAllCache() async {
    return _prefs.clear();
  }
}