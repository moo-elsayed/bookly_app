import 'package:bookly_app/core/widgets/custom_toast.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_states.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/entitis/book_entity.dart';
import '../../../../core/utils/app_router.dart';
import 'loading_custom_list_view_item.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({
    super.key,
  });

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  late ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxScrollLength && !isLoading) {
      isLoading = true;
      await context
          .read<FeaturedBooksCubit>()
          .fetchFeaturedBooks(pageNumber: nextPage++);
      isLoading = false;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<BookEntity> booksList = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksStates>(
      listener: (context, state) {
        if (state is FeaturedBookSuccess) {
          booksList.addAll(state.books);
        } else if (state is FeaturedBooksPaginationFailure) {
          showCustomToast(
            context: context,
            message: state.errorMessage,
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBookSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * (.27),
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 15 : 10,
                  right: index == booksList.length - 1 ? 10 : 0,
                ),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.KBookDetailsView,
                      extra: booksList[index],
                    );
                  },
                  child: CustomListViewItem(
                    imgUrl: booksList[index].image ?? '',
                  ),
                ),
              ),
              itemCount: booksList.length,
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * (.27),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == 6 - 1 ? 10 : 0,
                  ),
                  child: const LoadingCustomListViewItem(),
                );
              },
            ),
          );
        }
      },
    );
  }
}