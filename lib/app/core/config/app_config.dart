class AppConfig {
  static AppConfig get instance {
    if (_instance == null) {
      const apiKey = String.fromEnvironment('API_KEY');
      const baseUrl = String.fromEnvironment('BASE_URL');
      const imageUrl = String.fromEnvironment('IMAGE_URL');

      _instance = AppConfig._internal(
        apiKey: apiKey,
        baseUrl: baseUrl,
        imageUrl: imageUrl,
      );
    }

    return _instance!;
  }

  static AppConfig? _instance;

  AppConfig._internal({
    required this.apiKey,
    required this.baseUrl,
    required this.imageUrl,
  });

  final String apiKey;
  final String baseUrl;
  final String imageUrl;
}
