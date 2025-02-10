import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/api_serves.dart';
import '../../../../core/utils/funcations/save_books.dart';
import '../../domain/entitis/book_entity.dart';
import '../models/book_model.dart';

abstract class HomeRemoteDataSource {
  /*
  هو مش بي handel لو فى error او لا
  دي وظيفة ال repo
  هو بيعمل fetch للبيانات وبس
  */

  Future<List<BookEntity>> fetchNewestBooks();

  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiServes apiServes;

  HomeRemoteDataSourceImp({required this.apiServes});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiServes.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: KBookBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServes.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=computer science&sorting=newest');
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var data = await apiServes.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&sorting=relevance');
    List<BookEntity> books = getBooksList(data);
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
