import 'package:flutter/material.dart';
import '../models/library.dart';
import 'manage_screen.dart';
import 'books_screen.dart';
import 'staff_screen.dart';

class HomeScreen extends StatefulWidget {
  final Library library;
  const HomeScreen({super.key, required this.library});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      ManageScreen(library: widget.library),
      BooksScreen(library: widget.library),
      StaffScreen(library: widget.library),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Quản lý",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "DS Sách",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Nhân viên",
          ),
        ],
      ),
    );
  }
}
