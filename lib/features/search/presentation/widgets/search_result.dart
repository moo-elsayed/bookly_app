import 'dart:developer';
import 'package:bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:bookly_app/core/widgets/book_listView_item.dart';
import 'package:bookly_app/core/widgets/loading_book_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/managers/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/managers/search_books_cubit/search_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/entitis/book_entity.dart';
import '../../../../core/widgets/custom_toast.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResult();
}

class _SearchResult extends State<SearchResult> {
  late ScrollController _scrollController;
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
      SearchBooksCubit cubit = context.read<SearchBooksCubit>();
      int nextPage = cubit.nextPage;

      isLoading = true;
      await cubit.searchBooks(
        title: cubit.getSearchQuery(),
        pageNumber: nextPage,
      );
      cubit.incrementNextPage();
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
    return BlocConsumer<SearchBooksCubit, SearchBooksStates>(
      listener: (context, state) {
        if (state is SearchBookSuccess) {
          SearchBooksCubit cubit = context.read<SearchBooksCubit>();
          if (cubit.getNextPage() == 1) booksList.clear();
          booksList.addAll(state.books);
          log(booksList.length.toString());
        } else if (state is SearchBooksPaginationFailure) {
          showCustomToast(
            context: context,
            message: state.errorMessage,
            contentType: ContentType.failure,
          );
        } else if (state is SearchBooksFailure) {
          showCustomToast(
            context: context,
            message: state.errorMessage,
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        if (state is SearchBookSuccess ||
            state is SearchBooksPaginationLoading ||
            state is SearchBooksPaginationFailure) {
          return ListView.builder(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: booksList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: BookListViewItem(bookEntity: booksList[index]),
              );
            },
          );
        } else if (state is SearchBooksLoading) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: CustomFadingWidget(child: LoadingBookListViewItem()),
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
