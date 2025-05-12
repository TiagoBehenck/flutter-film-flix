import 'package:filme_flix/common/infra/db/storage.dart';
import 'package:filme_flix/common/models/movie.dart';

abstract class CachedRepository {
  final Storage _storage = Storage();

  /// Método para obter um objeto único com cache
  /// - `apiCall`: método da API que será chamado caso o cache não exista ou esteja expirado
  /// - `cacheKey`: chave para armazenar/recuperar dados do cache
  /// - `cacheDuration`: duração do cache em minutos (padrão: 30 minutos)
  /// - `forceRefresh`: força atualização do cache, ignorando dados existentes (padrão: false)
  ///
  /// Retorna o objeto do cache ou da API
  ///
  /// Se falhar a API e o cache estiver expirado, retorna o cache como fallback
  ///
  /// Se não houver cache, propaga o erro
  Future<T> getObjectWithCache<T>({
    required Future<T> Function() apiCall,
    required String cacheKey,
    bool forceRefresh = false,
    int cacheDuration = 30,
  }) async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    // Verificar se existe cache válido
    if (!forceRefresh && _storage.hasKey(key: cacheKey)) {
      final cachedTime = _storage.getTimestamp(key: cacheKey);

      // Se o cache existe e não expirou
      if (currentTime - cachedTime < cacheDuration * 60 * 1000) {
        // Buscamos do storage como lista e pegamos o primeiro item
        final cachedMovies = await _storage.get(key: cacheKey);
        if (cachedMovies.isNotEmpty) {
          final movieJson = cachedMovies.first;
          return movieJson as T;
        }
      }
    }

    // Se não tem cache ou expirou, busca da API
    try {
      final result = await apiCall();

      // Salva no cache (como lista com um único item)
      if (result is Movie) {
        await _storage.save(key: cacheKey, movies: [result]);
        await _storage.saveTimestamp(key: cacheKey, timestamp: currentTime);
      }

      return result;
    } catch (e) {
      // Se falhar a API e tiver cache (mesmo expirado), usa o cache como fallback
      if (_storage.hasKey(key: cacheKey)) {
        final cachedMovies = await _storage.get(key: cacheKey);
        if (cachedMovies.isNotEmpty) {
            return cachedMovies.first as T;
        }
      }

      // Se não tiver cache, propaga o erro
      rethrow;
    }
  }

  /// Método para obter uma lista de objetos com cache
  Future<List<T>> getListWithCache<T>({
    required Future<List<T>> Function() apiCall,
    required String cacheKey,
    bool forceRefresh = false,
    int cacheDuration = 30,
  }) async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    // Verificar se existe cache válido
    if (!forceRefresh && _storage.hasKey(key: cacheKey)) {
      final cachedTime = _storage.getTimestamp(key: cacheKey);

    //   // Se o cache existe e não expirou
      if (currentTime - cachedTime < cacheDuration * 60 * 1000) {
        final movies = await _storage.get(key: cacheKey);
        return movies as List<T>;
      }
    }

    // Se não tem cache ou expirou, busca da API
    try {
      final results = await apiCall();

      // Salva no cache
      if (results is List<Movie>) {
        await _storage.save(key: cacheKey, movies: (results as List<Movie>));
        await _storage.saveTimestamp(key: cacheKey, timestamp: currentTime);
      }

      return results;
    } catch (e) {
      // Se falhar a API e tiver cache (mesmo expirado), usa o cache como fallback
      if (_storage.hasKey(key: cacheKey)) {
        final movies = await _storage.get(key: cacheKey);
        return movies as List<T>;
      }

      // Se não tiver cache, propaga o erro
      rethrow;
    }
  }

  Future<void> clearCache(String cacheKey) async {
    await _storage.remove(key: cacheKey);
    await _storage.removeTimestamp(key: cacheKey);
  }
}
