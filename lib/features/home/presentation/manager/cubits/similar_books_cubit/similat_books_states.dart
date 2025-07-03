import 'package:bookly_app/features/home/domain/entitis/book_entity.dart';

abstract class SimilarBooksStates {}

class SimilarBooksInitial extends SimilarBooksStates {}

class SimilarBooksLoading extends SimilarBooksStates {}

class SimilarBooksFailure extends SimilarBooksStates {
  final String errorMessage;

  SimilarBooksFailure({required this.errorMessage});
}

class SimilarBookSuccess extends SimilarBooksStates {
  final List<BookEntity> books;

  SimilarBookSuccess({required this.books});
}
