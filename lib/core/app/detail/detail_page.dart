import 'package:filme_flix/core/app/detail/repository/detail_repository.dart';
import 'package:filme_flix/core/app/detail/service/detail_service.dart';
import 'package:filme_flix/core/app/detail/widgets/detail_error/detail_error.dart';
import 'package:filme_flix/core/http/service/_base/base_service.dart';
import 'package:filme_flix/core/app/detail/widgets/detail_loading/detail_loading.dart';
import 'package:filme_flix/models/movie.dart';
import 'package:filme_flix/core/app/detail/widgets/blurred_backdrop_image/blurred_backdrop_image.dart';
import 'package:filme_flix/common/extensions/build_context_extension.dart';
import 'package:filme_flix/core/app/detail/widgets/collapsed_app_bar_content/collapsed_app_bar_content.dart';
import 'package:filme_flix/core/app/detail/widgets/expanded_app_bar_content/expanded_app_bar_content.dart';
import 'package:filme_flix/core/app/detail/widgets/content/content.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    required this.movie,
    super.key,
  });
  final Movie movie;
  static const collapsedBarHeight = 60.0;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;
  late final DetailRepository _repository;
  late final DetailService _service;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _service = DetailService(BaseService());
    _repository = DetailRepository(
      _service,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    const showTitleThreshold = 490.0;

    if (_scrollController.offset > showTitleThreshold && !_showTitle) {
      setState(() {
        _showTitle = true;
      });
    } else if (_scrollController.offset <= showTitleThreshold && _showTitle) {
      setState(() {
        _showTitle = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final expandedBarHeight = context.height * 0.55;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return FutureBuilder<Movie?>(
      future: _repository.getMovieDetails(widget.movie.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const DetailLoading();
        }
        if (snapshot.hasError) {
          return DetailError(
            onRetry: () {
              _repository.getMovieDetails(widget.movie.id);
            },
          );
        }
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: Text('No data available'),
            ),
          );
        }

        final movieDetail = snapshot.data!;

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned.fill(
                child: BlurredBackdropImage(movie: widget.movie),
              ),
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    expandedHeight: expandedBarHeight,
                    collapsedHeight: DetailPage.collapsedBarHeight,
                    centerTitle: false,
                    pinned: true,
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _showTitle ? 1 : 0,
                      child: CollapsedAppBarContent(movie: movieDetail),
                    ),
                    elevation: 0,
                    backgroundColor:
                        _showTitle ? Colors.black : Colors.transparent,
                    leading: const BackButton(
                      color: Colors.white,
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: ExpandedAppBarContent(
                        movie: movieDetail,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: context.height -
                            DetailPage.collapsedBarHeight -
                            statusBarHeight,
                      ),
                      child: Material(
                        elevation: 7,
                        child: Content(movie: movieDetail),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
