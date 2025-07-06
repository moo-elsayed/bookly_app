import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../entitis/book_entity.dart';


class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.KBookDetailsView, extra: bookEntity);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 125,
                child: CustomListViewItem(
                  imgUrl: bookEntity.image ?? '',
                  //  imgUrl: bookEntity.volumeInfo!.imageLinks!.thumbnail!,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookEntity.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle22.copyWith(
                      color: Colors.white,
                      fontFamily: KGtSectraFineFont,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Text(
                      bookEntity.authorName ?? 'no name',
                      style: Styles.textStyle16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle22.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      BookRating(
                        rating: bookEntity.rating ?? 0,
                        count: bookEntity.ratingCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
