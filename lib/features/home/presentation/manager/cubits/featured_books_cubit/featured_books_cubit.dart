import 'package:bookly_app/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/use_cases/fetch_featured_books_use_case.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    emit(
      pageNumber == 0
          ? FeaturedBooksLoading()
          : FeaturedBooksPaginationLoading(),
    );
    var result = await featuredBooksUseCase.call(pageNumber);
    result.fold(
      (failure) => emit(
        pageNumber == 0
            ? FeaturedBooksFailure(errorMessage: failure.errorMessage)
            : FeaturedBooksPaginationFailure(
                errorMessage: failure.errorMessage,
              ),
      ),
      (books) => emit(
        FeaturedBookSuccess(books: books),
      ),
    );
  }
}
