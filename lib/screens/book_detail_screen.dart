import 'package:flutter/material.dart';
import '../models/book_model.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child:
                  book.coverId != null
                      ? Image.network(book.coverImageUrl, height: 250)
                      : const Icon(Icons.book, size: 100),
            ),
            const SizedBox(height: 20),
            Text(book.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Autor(es): ${book.authors.join(', ')}'),
            if (book.publishYear != null) ...[
              const SizedBox(height: 8),
              Text('Ano de publicação: ${book.publishYear}'),
            ],
          ],
        ),
      ),
    );
  }
}
