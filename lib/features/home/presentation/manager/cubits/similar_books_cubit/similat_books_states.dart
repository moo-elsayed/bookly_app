import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

abstract class SimilarBooksStates {}

class SimilarBooksInitial extends SimilarBooksStates {}

class SimilarBooksLoading extends SimilarBooksStates {}

class SimilarBooksFailure extends SimilarBooksStates {
  final String errorMessage;

  SimilarBooksFailure({required this.errorMessage});
}

class SimilarBookSuccess extends SimilarBooksStates {
  final List<BookModel> books;

  SimilarBookSuccess({required this.books});
}
