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

  Future<List<Movie>> saveOne({
    required String key,
    required Movie movie,
  }) async {
    final existingData = _prefs.getStringList(key) ?? [];
    final updatedData = [
      ...existingData,
      jsonEncode(movie.toJson()),
    ];

    await _prefs.setStringList(key, updatedData);

    return updatedData.map((item) => Movie.fromJson(jsonDecode(item))).toList();
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

  Future<Movie?> getOne({
    required String key,
    required int movieId,
  }) async {
    try {
      final data = _prefs.getStringList(key);

      if (data == null || data.isEmpty) {
        return null;
      }

      for (final movieJson in data) {
        try {
          final movie = Movie.fromJson(jsonDecode(movieJson));
          if (movie.id == movieId) {
            return movie;
          }
        } catch (jsonError) {
          continue;
        }
      }

      return null;
    } catch (e) {
      throw Exception('Failed to retrieve movie from storage: $e');
    }
  }

  Future<void> remove({required String key}) async {
    await _prefs.remove(key);
  }

  Future<List<Movie>> removeItem(
      {required String key, required Movie movie}) async {
    final data = _prefs.getStringList(key);

    if (data != null) {
      final updatedList = data
          .map((item) => Movie.fromJson(jsonDecode(item)))
          .where((m) => m.id != movie.id)
          .toList();

      final jsonList = updatedList.map((m) => jsonEncode(m.toJson())).toList();
      await _prefs.setStringList(key, jsonList);

      return updatedList;
    } else {
      return [];
    }
  }

  bool hasKey({required String key}) {
    return _prefs.containsKey(key);
  }

  Future<void> saveTimestamp(
      {required String key, required int timestamp}) async {
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
}
