import 'package:bookly_app/features/home/presentation/manager/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/similar_books_cubit/similat_books_states.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/widgets/custom_error_widget.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksStates>(
      builder: (context, state) {
        if (state is SimilarBookSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * (.15),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CustomListViewItem(
                      imgUrl: state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                    ),
                  ),
                  itemCount: state.books.length,
                )),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * (.15),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: CustomListViewItem(
                        imgUrl:
                        'https://th.bing.com/th/id/OIP.dWqMA2-SRXYl4PNmln7ZrgHaE8?rs=1&pid=ImgDetMain',
                      ),
                    ),
                    itemCount: 5,
                  )),
            ),
          );
        }
      },
    );
  }
}
