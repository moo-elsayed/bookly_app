import 'package:bookly_app/core/entitis/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../data_sources/search_remote_data_source.dart';

class SearchRepoImp implements SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImp({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks(
      {int pageNumber = 0, required String title}) async {
    try {
      final books = await searchRemoteDataSource.searchBooks(
        title: title,
        pageNumber: pageNumber,
      );
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
