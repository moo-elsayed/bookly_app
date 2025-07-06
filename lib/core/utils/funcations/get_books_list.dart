import '../../entitis/book_entity.dart';
import '../../models/book_model/book_model.dart';

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var item in data['items']) {
    books.add(BookModel.fromJson(item));
  }
  return books;
}
