import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/newest_books_cubit/newest_books_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    emit(
      pageNumber == 0 ? NewestBooksLoading() : NewestBooksPaginationLoading(),
    );
    var result = await fetchNewestBooksUseCase.call(pageNumber);
    result.fold(
      (failure) => emit(
        pageNumber == 0
            ? NewestBooksFailure(errorMessage: failure.errorMessage)
            : NewestBooksPaginationFailure(errorMessage: failure.errorMessage),
      ),
      (books) => emit(
        NewestBookSuccess(books: books),
      ),
    );
  }
}
