import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/entitis/book_entity.dart';
import '../../../../core/errors/failures.dart';
import '../repos/home_repo.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([String param = '']) async {
    // u can check permission
    return await homeRepo.fetchSimilarBooks(category: param);
  }
}
