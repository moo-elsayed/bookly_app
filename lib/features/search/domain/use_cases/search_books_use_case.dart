import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/entitis/book_entity.dart';
import '../../../../core/errors/failures.dart';

class SearchBooksUseCase extends UseCase<List<BookEntity>, SearchBooksParams> {
  final SearchRepo searchRepo;

  SearchBooksUseCase({required this.searchRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [SearchBooksParams? params]) async {
    return await searchRepo.searchBooks(
      title: params!.title,
      pageNumber: params.pageNumber,
    );
  }
}

class SearchBooksParams {
  final String title;
  final int pageNumber;

  SearchBooksParams({required this.title, this.pageNumber = 0});
}
