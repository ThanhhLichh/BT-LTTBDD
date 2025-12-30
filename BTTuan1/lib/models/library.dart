import 'package:flutter/foundation.dart';
import 'book.dart';
import 'staff.dart';
import 'user.dart';

class Library extends ChangeNotifier {
  final List<Book> _books = [];
  final List<User> _users = [];

  Staff _currentStaff = Staff("Nguyen Van A");

  List<Book> get books => List.unmodifiable(_books);
  List<User> get users => List.unmodifiable(_users);
  Staff get currentStaff => _currentStaff;

  void seedDataIfEmpty() {
    if (_books.isEmpty) {
      _books.addAll([
        Book(id: "1", title: "Sách 01"),
        Book(id: "2", title: "Sách 02"),
      ]);
    }
    if (_users.isEmpty) {
      _users.addAll([
        User("Nguyen Van B"),
        User("Tran Thi C"),
      ]);
    }
  }

  void changeStaffName(String newName) {
    _currentStaff.name = newName;
    notifyListeners();
  }

  void addBook(String title) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    _books.add(Book(id: id, title: title));
    notifyListeners();
  }

  void toggleBorrow(Book book) {
    book.toggleBorrowed();
    notifyListeners();
  }

  void addUser(String name) {
    _users.add(User(name));
    notifyListeners();
  }
}
