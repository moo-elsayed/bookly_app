import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_listView_item.dart';
import 'package:bookly_app/features/search/presentation/widgets/custom_search_textField.dart';
import 'package:bookly_app/features/search/presentation/widgets/search_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomSearchTextField(),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'Search Results',
              style: Styles.textStyle20,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(child: SearchResult()),
        ],
      ),
    );
  }
}
