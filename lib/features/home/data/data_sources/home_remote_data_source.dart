import 'package:bookly_app/constants.dart';
import '../../../../core/utils/api_serves.dart';
import '../../../../core/utils/funcations/save_books.dart';
import '../../domain/entitis/book_entity.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  /*
  هو مش بي handel لو فى error او لا
  دي وظيفة ال repo
  هو بيعمل fetch للبيانات وبس
  */

  Future<List<BookEntity>> fetchNewestBooks();

  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});

  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiServes apiServes;

  HomeRemoteDataSourceImp({required this.apiServes});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiServes.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&startIndex=${pageNumber*10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: KFeaturedBookBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServes.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=computer science&sorting=newest');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: KNewestBookBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var data = await apiServes.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&sorting=relevance');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: KSimilarBookBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
