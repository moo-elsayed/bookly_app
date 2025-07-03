import 'package:bookly_app/core/utils/funcations/launch_url.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/domain/entitis/book_entity.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              textColor: Colors.black,
              buttonColor: Colors.white,
              text: 'Free',
              onPressed: () {},
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomUrl(context, bookEntity.previewLink);
              },
              text: (bookEntity.previewLink == null)
                  ? 'Not available'
                  : 'Preview',
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              buttonColor: const Color(0xffEF8262),
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
