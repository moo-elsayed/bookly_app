import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/managers/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/widgets/custom_search_textField.dart';
import 'package:bookly_app/features/search/presentation/widgets/search_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SearchBooksCubit cubit = context.read<SearchBooksCubit>();
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomSearchTextField(
              controller: searchController,
              onPressed: () {
                cubit.setSearchQuery(searchQuery: searchController.text);
                cubit.searchBooks(title: cubit.getSearchQuery());
              },
              onFieldSubmitted: (value) {
                cubit.setSearchQuery(searchQuery: value);
                cubit.searchBooks(title: cubit.getSearchQuery());
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'Search Results',
              style: Styles.textStyle20,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Expanded(
            child: SearchResult(),
          ),
        ],
      ),
    );
  }
}
