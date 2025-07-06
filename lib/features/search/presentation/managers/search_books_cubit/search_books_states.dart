import '../../../../../../core/entitis/book_entity.dart';

abstract class SearchBooksStates {}

class SearchBooksInitial extends SearchBooksStates {}

class SearchBooksLoading extends SearchBooksStates {}

class SearchBooksPaginationLoading extends SearchBooksStates {}

class SearchBooksFailure extends SearchBooksStates {
  final String errorMessage;

  SearchBooksFailure({required this.errorMessage});
}

class SearchBooksPaginationFailure extends SearchBooksStates {
  final String errorMessage;

  SearchBooksPaginationFailure({required this.errorMessage});
}

class SearchBookSuccess extends SearchBooksStates {
  final List<BookEntity> books;

  SearchBookSuccess({required this.books});
}
