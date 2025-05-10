class Data {
  final String title;
  final List<Book> data;

  Data({required this.title, required this.data});

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(title: json['title'], data: (json['data'] as List).map((e)=>Book.fromJson(e)).toList());
}

class Book {
  final String name;
  final String path;

  Book({required this.name, required this.path});

  factory Book.fromJson(Map<String, dynamic> json)=>
      Book(name: json['name'], path: json['path']);

  @override
  String toString() {
    return '{name: $name, path: $path}';
  }
}