
import '../../../../../../core/entitis/book_entity.dart';

abstract class NewestBooksStates {}

class NewestBooksInitial extends NewestBooksStates {}

class NewestBooksLoading extends NewestBooksStates {}

class NewestBooksPaginationLoading extends NewestBooksStates {}

class NewestBooksFailure extends NewestBooksStates {
  final String errorMessage;

  NewestBooksFailure({required this.errorMessage});
}

class NewestBooksPaginationFailure extends NewestBooksStates {
  final String errorMessage;

  NewestBooksPaginationFailure({required this.errorMessage});
}

class NewestBookSuccess extends NewestBooksStates {
  final List<BookEntity> books;

  NewestBookSuccess({required this.books});
}
