import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:bookly_app/features/home/domain/entitis/book_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repos/home_repo.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber = 0]) async {
    // u can check permission
    return await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
  }
}
