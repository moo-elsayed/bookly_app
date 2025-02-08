import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/widgets/newest_books_listView.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const CustomListView(),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 30, bottom: 20),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle20.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: NewestBooksListView(),
        )
      ],
    ));
  }
}


