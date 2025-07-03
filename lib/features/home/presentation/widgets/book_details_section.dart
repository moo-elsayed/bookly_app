import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import '../../domain/entitis/book_entity.dart';
import 'book_rating.dart';
import 'books_actions.dart';
import 'custom_book_details_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBookDetailsImage(
          img: bookEntity.image ?? '' ,
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                bookEntity.title,
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
                  bookEntity.authorName ?? 'no name',
                  textAlign: TextAlign.center,
                  style: Styles.textStyle20.copyWith(fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          count: bookEntity.ratingCount ?? 0,
          rating: bookEntity.rating ?? 0,
        ),
        const SizedBox(
          height: 30,
        ),
        BookActions(
          bookEntity: bookEntity,
        ),
      ],
    );
  }
}