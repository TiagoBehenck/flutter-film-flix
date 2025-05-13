sealed class SearchEvents {}

class GetSearch extends SearchEvents {
  final String searchTerm;

  GetSearch({
    required this.searchTerm,
  });
}

class SearchInitial extends SearchEvents {}