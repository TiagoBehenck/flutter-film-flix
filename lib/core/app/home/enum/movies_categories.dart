enum MoviesCategories {
  popular(title: "Popular", endpointPath: "/movie/popular"),
  topRated(title: "Top Rated", endpointPath: "/movie/top_rated"),
  discover(title: "Discover", endpointPath: "/discover/movie"),
  inTheaters(title: "In Theaters", endpointPath: "/movie/now_playing");
  
  final String title;
  final String endpointPath;

  const MoviesCategories({
    required this.title,
    required this.endpointPath,
  });
  

  static MoviesCategories fromTitle(String title) {
    return MoviesCategories.values.firstWhere(
      (category) => category.title == title,
      orElse: () => throw ArgumentError('Categoria não encontrada para o título: $title'),
    );
  }
  
  String get titleKey => title.toLowerCase().replaceAll(' ', '_');
  
  static MoviesCategories fromTitleKey(String titleKey) {
    return MoviesCategories.values.firstWhere(
      (category) => category.titleKey == titleKey,
      orElse: () => throw ArgumentError('Categoria não encontrada para a titleKey: $titleKey'),
    );
  }
  
  static final Map<String, MoviesCategories> byTitle = 
      {for (var category in MoviesCategories.values) category.title: category};
      
  static final Map<String, MoviesCategories> byTitleKey = 
      {for (var category in MoviesCategories.values) category.titleKey: category};
}
