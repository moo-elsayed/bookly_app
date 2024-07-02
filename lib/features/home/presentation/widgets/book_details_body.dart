import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/widgets/books_actions.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_appBar_book_details_view.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_book_details_image.dart';
import 'package:bookly_app/features/home/presentation/widgets/similar_books_listView.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookModel});

  final BookModel bookModel;

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
                  bookModel: bookModel,
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

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBookDetailsImage(
          img: bookModel.volumeInfo!.imageLinks!.thumbnail!,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          bookModel.volumeInfo!.title!,
          style: Styles.textStyle32
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
            opacity: .7,
            child: Text(
              bookModel.volumeInfo!.authors![0],
              style: Styles.textStyle20.copyWith(fontStyle: FontStyle.italic),
            )),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          count: bookModel.volumeInfo?.ratingsCount ?? 0,
          rating: bookModel.volumeInfo?.averageRating ?? 0,
        ),
        const SizedBox(
          height: 30,
        ),
        BookActions(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
