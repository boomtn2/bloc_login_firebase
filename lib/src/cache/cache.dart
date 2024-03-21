class CacheClient {
  final Map<String, Object> _cache;

  CacheClient() : _cache = {};

  void write<T extends Object>({required String key, required T value}) {
    _cache[key] = value;
  }

  T? read<T extends Object>({required String key}) {
    final cache = _cache[key];
    if (cache is T) return cache;
    return null;
  }
}
