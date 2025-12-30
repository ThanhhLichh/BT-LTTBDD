import 'package:flutter/material.dart';
import '../models/library.dart';

class BooksScreen extends StatefulWidget {
  final Library library;
  const BooksScreen({super.key, required this.library});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  void initState() {
    super.initState();
    widget.library.addListener(_refresh);
  }

  void _refresh() => setState(() {});

  @override
  void dispose() {
    widget.library.removeListener(_refresh);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final books = widget.library.books;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("DS Sách")),
        body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (_, i) {
            final b = books[i];
            return ListTile(
              leading: const Icon(Icons.menu_book),
              title: Text(b.title),
              subtitle: Text(b.isBorrowed ? "Đang được mượn" : "Có sẵn"),
              trailing: Switch(
                value: b.isBorrowed,
                onChanged: (_) => widget.library.toggleBorrow(b),
              ),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: books.length,
        ),
      ),
    );
  }
}
