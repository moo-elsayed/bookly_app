import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/entitis/book_entity.dart';
import '../../../../core/errors/failures.dart';
import '../repos/home_repo.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber = 0]) async {
    // u can check permission
    return await homeRepo.fetchNewestBooks(pageNumber: pageNumber);
  }
}
