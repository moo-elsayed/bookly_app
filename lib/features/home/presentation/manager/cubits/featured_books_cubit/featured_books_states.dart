import 'package:bookly_app/features/home/domain/entitis/book_entity.dart';

abstract class FeaturedBooksStates {}

class FeaturedBooksInitial extends FeaturedBooksStates {}

class FeaturedBooksLoading extends FeaturedBooksStates {}

class FeaturedBooksFailure extends FeaturedBooksStates {
  final String errorMessage;

  FeaturedBooksFailure({required this.errorMessage});
}

class FeaturedBookSuccess extends FeaturedBooksStates {
  final List<BookEntity> books;

  FeaturedBookSuccess({required this.books});
}
