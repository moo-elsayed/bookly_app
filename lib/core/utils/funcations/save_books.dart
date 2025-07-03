import 'package:hive/hive.dart';
import '../../../features/home/domain/entitis/book_entity.dart';

void saveBooksData({required List<BookEntity> books, required String boxName}) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
