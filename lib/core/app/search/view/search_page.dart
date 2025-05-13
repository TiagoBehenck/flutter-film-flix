import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:filme_flix/common/styles/text/app_text_styles.dart';
import 'package:filme_flix/core/app/search/store/events/search_events.dart';
import 'package:filme_flix/core/app/search/store/bloc/search_bloc.dart';
import 'package:filme_flix/core/app/search/store/state/search_state.dart';
import 'package:filme_flix/common/widgets/search_input/search_input.dart';

import 'package:filme_flix/core/app/search/view/loading/search_loading.dart';
import 'package:filme_flix/core/app/search/view/success/search_success.dart';
import 'package:filme_flix/core/app/search/view/error/search_error.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController searchController;
  late final SearchBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<SearchBloc>();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    _bloc.add(SearchInitial());
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Search',
          style: AppTextStyles.h3,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            SearchInput(
              controller: searchController,
              onChanged: (value) {
                _bloc.add(GetSearch(searchTerm: value));
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: BlocBuilder<SearchBloc, SearchState>(
                  bloc: _bloc,
                  builder: (context, state) {
                    return switch (state) {
                      SearchStateInitial() => const SizedBox.shrink(),
                      SearchStateLoading() => const SearchLoading(),
                      SearchStateSuccess() => SearchSuccess(
                          movies: state.searchResults,
                          onLoadMore: () => _bloc.add(
                            GetSearch(
                              searchTerm: searchController.text,
                            ),
                          ),
                        ),
                      SearchStateError() => SearchError(
                          onRetry: () => _bloc.add(
                              GetSearch(searchTerm: searchController.text))),
                    };
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
