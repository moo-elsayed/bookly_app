import 'package:dartz/dartz.dart';
import '../../../../core/entitis/book_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber = 0});

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber = 0});

  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      {required String category});
}
