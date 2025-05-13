class Book {
  final String title;
  final List<String> authors;
  final int? coverId;
  final int? publishYear;

  Book({
    required this.title,
    required this.authors,
    this.coverId,
    this.publishYear,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] ?? 'Sem título',
      authors:
          (json['author_name'] as List?)?.map((a) => a.toString()).toList() ??
          ['Autor desconhecido'],
      coverId: json['cover_i'],
      publishYear: json['first_publish_year'],
    );
  }

  String get coverImageUrl {
    if (coverId == null) return '';
    return 'https://covers.openlibrary.org/b/id/$coverId-M.jpg';
  }
}
