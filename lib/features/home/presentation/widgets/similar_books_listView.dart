import 'package:bookly_app/features/home/presentation/manager/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/similar_books_cubit/similat_books_states.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import 'loading_custom_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksStates>(
      builder: (context, state) {
        if (state is SimilarBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * (.15),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 30 : 10,
                  right: index == state.books.length - 1 ? 10 : 0,
                ),
                child: CustomListViewItem(
                  imgUrl: state.books[index].image!,
                ),
              ),
              itemCount: state.books.length,
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * (.15),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 30 : 10,
                    right: index == 5 - 1 ? 10 : 0,
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
