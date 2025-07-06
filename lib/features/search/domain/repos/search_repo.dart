import 'package:dartz/dartz.dart';
import '../../../../core/entitis/book_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> searchBooks(
      {int pageNumber = 0, required String title});
}
