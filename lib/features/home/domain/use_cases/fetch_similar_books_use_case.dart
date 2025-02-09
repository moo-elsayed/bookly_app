import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:bookly_app/features/home/domain/entitis/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

import '../repos/home_repo.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, String> {
  final DomainHomeRepo domainHomeRepo;

  FetchSimilarBooksUseCase({required this.domainHomeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([String? param]) async {
    // u can check permission
    return await domainHomeRepo.fetchSimilarBooks(category: param!);
  }
}
