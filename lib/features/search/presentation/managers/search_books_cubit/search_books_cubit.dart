import 'package:bookly_app/features/search/domain/use_cases/search_books_use_case.dart';
import 'package:bookly_app/features/search/presentation/managers/search_books_cubit/search_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksCubit extends Cubit<SearchBooksStates> {
  SearchBooksCubit(this.searchBooksUseCase) : super(SearchBooksInitial());

  final SearchBooksUseCase searchBooksUseCase;

  //-------------------------------------
  String searchQuery = '';

  void setSearchQuery({required String searchQuery}) {
    this.searchQuery = searchQuery;
    nextPage = 1;
  }

  String getSearchQuery() => searchQuery;

  //-------------------------------------
  int nextPage = 1;

  void incrementNextPage() => nextPage++;

  int getNextPage() => nextPage;

  //-------------------------------------

  Future<void> searchBooks({int pageNumber = 0, required String title}) async {
    if (title.isEmpty) {
      emit(SearchBooksFailure(errorMessage: 'empty filed'));
      return;
    }
    emit(
      pageNumber == 0 ? SearchBooksLoading() : SearchBooksPaginationLoading(),
    );
    var result = await searchBooksUseCase
        .call(SearchBooksParams(title: title, pageNumber: pageNumber));
    result.fold(
      (failure) => emit(
        pageNumber == 0
            ? SearchBooksFailure(errorMessage: failure.errorMessage)
            : SearchBooksPaginationFailure(
                errorMessage: failure.errorMessage,
              ),
      ),
      (books) => emit(
        SearchBookSuccess(books: books),
      ),
    );
  }
}
