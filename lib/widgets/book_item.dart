import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../screens/book_detail_screen.dart';

class BookItem extends StatelessWidget {
  final Book book;

  const BookItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          book.coverId != null
              ? Image.network(book.coverImageUrl, width: 50, fit: BoxFit.cover)
              : Icon(Icons.book),
      title: Text(book.title),
      subtitle: Text(book.authors.join(', ')),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => BookDetailScreen(book: book)),
        );
      },
    );
  }
}
