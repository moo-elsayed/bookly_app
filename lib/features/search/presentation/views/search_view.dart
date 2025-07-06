import 'package:bookly_app/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/repos/search_repo_implementation.dart';
import '../../domain/use_cases/search_books_use_case.dart';
import '../managers/search_books_cubit/search_books_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBooksCubit(
        SearchBooksUseCase(
          searchRepo: getIt.get<SearchRepoImp>(),
        ),
      ),
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
