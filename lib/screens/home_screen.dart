import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book_model.dart';
import '../services/open_library_service.dart';
import '../widgets/book_item.dart';

class HomeScreen extends ChangeNotifier {
  final OpenLibraryService _service = OpenLibraryService();
  List<Book> books = [];
  bool isLoading = false;
  String error = '';

  Future<void> search(String query) async {
    isLoading = true;
    error = '';
    notifyListeners();

    try {
      books = await _service.fetchBooks(query);
    } catch (e) {
      error = 'Erro ao buscar livros.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    books = [];
    error = '';
    isLoading = false;
    notifyListeners();
  }
}

class HomeScreenWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomeScreen>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Busca de Livros')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Digite o nome do livro ou autor',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final query = _controller.text.trim();
                    if (query.isNotEmpty) {
                      home.search(query);
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    home.clear();
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child:
                  home.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : home.error.isNotEmpty
                      ? Center(child: Text(home.error))
                      : ListView.builder(
                        itemCount: home.books.length,
                        itemBuilder: (context, index) {
                          return BookItem(book: home.books[index]);
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
