import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../../../core/entitis/book_entity.dart';


abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});

  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});

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
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = startIndex + 10;

    var box = Hive.box<BookEntity>(KNewestBookBox);
    int length = box.values.length;

    if (startIndex >= length) {
      return [];
    }

    endIndex = endIndex > length ? length : endIndex;

    return box.values.toList().sublist(startIndex, endIndex);
  }

}
