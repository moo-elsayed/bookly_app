import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/domain/entitis/book_entity.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_appBar_book_details_view.dart';
import 'package:bookly_app/features/home/presentation/widgets/similar_books_listView.dart';
import 'package:flutter/material.dart';

import 'book_details_section.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Column(
              children: [
                const CustomAppBarBookDetailsBody(),
                BookDetailsSection(
                  bookEntity: bookEntity,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'You can also like',
                        style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SimilarBooksListView(
                  imgUrl:
                      'https://th.bing.com/th/id/OIP.dWqMA2-SRXYl4PNmln7ZrgHaE8?rs=1&pid=ImgDetMain',
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
