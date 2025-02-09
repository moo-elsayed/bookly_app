import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:bookly_app/features/home/domain/entitis/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

import '../repos/home_repo.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final DomainHomeRepo domainHomeRepo;

  FetchFeaturedBooksUseCase({required this.domainHomeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int? param]) async {
    // u can check permission
    return await domainHomeRepo.fetchFeaturedBooks();
  }
}
