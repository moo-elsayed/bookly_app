import '../../../../core/entitis/book_entity.dart';
import '../../../../core/utils/api_serves.dart';
import '../../../../core/utils/funcations/get_books_list.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> searchBooks(
      {int pageNumber = 0, required String title});
}

class SearchRemoteDataSourceImp implements SearchRemoteDataSource {
  final ApiServes apiServes;

  SearchRemoteDataSourceImp({required this.apiServes});

  @override
  Future<List<BookEntity>> searchBooks(
      {int pageNumber = 0, required String title}) async {
    var data = await apiServes.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=$title&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}
