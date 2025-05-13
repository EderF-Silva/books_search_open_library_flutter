import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book_model.dart';

class OpenLibraryService {
  Future<List<Book>> fetchBooks(String query) async {
    final encodedQuery = Uri.encodeComponent(query);
    final url = Uri.parse(
      'https://openlibrary.org/search.json?q=$encodedQuery',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(
          utf8.decode(response.bodyBytes),
        ); // Suporte a acentuação
        final booksJson = data['docs'] as List;
        return booksJson.map((json) => Book.fromJson(json)).toList();
      } else {
        throw Exception('Erro ao buscar livros');
      }
    } catch (e) {
      rethrow;
    }
  }
}
