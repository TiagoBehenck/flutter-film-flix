// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:filme_flix/app/common/extensions/build_context_extension.dart';
import 'package:filme_flix/app/common/models/movie.dart';
import 'package:filme_flix/app/core/client/http/service/_base/base_service.dart';
import 'package:filme_flix/app/modules/dashboard/detail/repository/detail_repository.dart';
import 'package:filme_flix/app/modules/dashboard/detail/service/detail_service.dart';
import 'package:filme_flix/app/modules/dashboard/detail/widgets/blurred_backdrop_image/blurred_backdrop_image.dart';
import 'package:filme_flix/app/modules/dashboard/detail/widgets/collapsed_app_bar_content/collapsed_app_bar_content.dart';
import 'package:filme_flix/app/modules/dashboard/detail/widgets/content/content.dart';
import 'package:filme_flix/app/modules/dashboard/detail/widgets/detail_error/detail_error.dart';
import 'package:filme_flix/app/modules/dashboard/detail/widgets/detail_loading/detail_loading.dart';
import 'package:filme_flix/app/modules/dashboard/detail/widgets/expanded_app_bar_content/expanded_app_bar_content.dart';

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
  late Future<Movie> _movieDetailsFuture;
  late final DetailService _service;
  late final DetailRepository _repository;
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _service = DetailService(BaseService());
    _repository = DetailRepository(
      _service,
    );
    _movieDetailsFuture = _repository.getMovieDetails(widget.movie.id);
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
    final expandedBarHeight = context.height * 0.6;
    final statusBarHeight = context.paddingTop;

    return FutureBuilder<Movie>(
      future: _movieDetailsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const DetailLoading();
        }
        if (snapshot.hasError) {
          return DetailError(
            onRetry: () {
              _movieDetailsFuture;
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
