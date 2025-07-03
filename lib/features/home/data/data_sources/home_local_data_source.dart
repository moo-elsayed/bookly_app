import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entitis/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();

  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});

  List<BookEntity> fetchSimilarBooks();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = startIndex + 10;

    var box = Hive.box<BookEntity>(KFeaturedBookBox);
    int length = box.values.length;

    if (startIndex >= length) {
      return [];
    }

    endIndex = endIndex > length ? length : endIndex;

    return box.values.toList().sublist(startIndex, endIndex);
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
