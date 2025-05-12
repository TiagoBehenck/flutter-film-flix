sealed class SearchEvents {}

class GetSearch extends SearchEvents {
  final String searchText;

  GetSearch({
    required this.searchText,
  });
}

class SearchInitial extends SearchEvents {}