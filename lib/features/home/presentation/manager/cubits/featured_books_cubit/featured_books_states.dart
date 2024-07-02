import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

abstract class FeaturedBooksStates {}

class FeaturedBooksInitial extends FeaturedBooksStates {}

class FeaturedBooksLoading extends FeaturedBooksStates {}

class FeaturedBooksFailure extends FeaturedBooksStates {
  final String errorMessage;

  FeaturedBooksFailure({required this.errorMessage});
}

class FeaturedBookSuccess extends FeaturedBooksStates {
  final List<BookModel> books;

  FeaturedBookSuccess({required this.books});
}
