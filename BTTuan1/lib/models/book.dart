class Book {
  final String id;
  final String title;
  bool isBorrowed;

  Book({
    required this.id,
    required this.title,
    this.isBorrowed = false,
  });

  void toggleBorrowed() {
    isBorrowed = !isBorrowed;
  }
}
