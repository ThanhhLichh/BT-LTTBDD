import 'package:flutter/material.dart';

class ColumnListScreen extends StatelessWidget {
  const ColumnListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(1000000, (index) => index + 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Column'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: items.map((item) {
            return _item(item);
          }).toList(),
        ),
      ),
    );
  }

  Widget _item(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Text(
          index.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        title: const Text(
          'The only way to do great work',
        ),
        subtitle: const Text(
          'is to love what you do.',
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
