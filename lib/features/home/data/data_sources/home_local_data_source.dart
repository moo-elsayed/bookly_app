import '../../domain/entitis/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();

  List<BookEntity> fetchFeaturedBooks();

  List<BookEntity> fetchSimilarBooks({required String category});
}

class HomeLocalDataSourceImp extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchSimilarBooks({required String category}) {
    // TODO: implement fetchSimilarBooks
    throw UnimplementedError();
  }
  
}