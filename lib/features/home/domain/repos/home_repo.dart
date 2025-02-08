import 'package:bookly_app/features/home/domain/entitis/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class DomainHomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
}
