import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_states.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/app_router.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({
    super.key,
  });

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  late ScrollController _scrollController;
  int nextPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxScrollLength) {
      context
          .read<FeaturedBooksCubit>()
          .fetchFeaturedBooks(pageNumber: nextPage++);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksStates>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * (.27),
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 15 : 10,
                  right: index == state.books.length - 1 ? 10 : 0,
                ),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.KBookDetailsView,
                      extra: state.books[index],
                    );
                  },
                  child: CustomListViewItem(
                    imgUrl: state.books[index].image ?? '',
                  ),
                ),
              ),
              itemCount: state.books.length,
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * (.27),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 15 : 10,
                      right: index == 4 ? 10 : 0,
                    ),
                    child: const CustomListViewItem(
                      imgUrl:
                          'https://th.bing.com/th/id/OIP.dWqMA2-SRXYl4PNmln7ZrgHaE8?rs=1&pid=ImgDetMain',
                    ),
                  ),
                  itemCount: 5,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
