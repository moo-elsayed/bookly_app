import 'dart:developer';
import 'package:bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/newest_books_cubit/newest_books_status.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_listView_item.dart';
import 'package:bookly_app/features/home/presentation/widgets/loading_book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../domain/entitis/book_entity.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({super.key});

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {

  List<BookEntity> booksList = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksStates>(
      listener: (context, state) {
        if (state is NewestBookSuccess) {
          booksList.addAll(state.books);
          log(booksList.length.toString());
        } else if (state is NewestBooksPaginationFailure) {
          showCustomToast(
            context: context,
            message: state.errorMessage,
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        if (state is NewestBookSuccess ||
            state is NewestBooksPaginationFailure ||
            state is NewestBooksPaginationLoading) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: booksList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: BookListViewItem(bookEntity: booksList[index]),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: CustomFadingWidget(child: LoadingBookListViewItem()),
              );
            },
          );
        }
      },
    );
  }
}
