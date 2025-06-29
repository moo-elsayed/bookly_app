import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entitis/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();

  List<BookEntity> fetchFeaturedBooks();

  List<BookEntity> fetchSimilarBooks();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(KFeaturedBookBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(KNewestBookBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchSimilarBooks() {
    var box = Hive.box<BookEntity>(KSimilarBookBox);
    return box.values.toList();
  }
}
