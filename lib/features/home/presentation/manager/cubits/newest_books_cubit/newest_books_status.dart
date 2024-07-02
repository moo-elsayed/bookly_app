import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

abstract class NewestBooksStates {}

class NewestBooksInitial extends NewestBooksStates {}

class NewestBooksLoading extends NewestBooksStates {}

class NewestBooksFailure extends NewestBooksStates {
  final String errorMessage;

  NewestBooksFailure({required this.errorMessage});
}

class NewestBookSuccess extends NewestBooksStates {
  final List<BookModel> books;

  NewestBookSuccess({required this.books});
}
