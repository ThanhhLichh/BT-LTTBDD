import 'package:flutter/material.dart';

class LazyListScreen extends StatelessWidget {
  const LazyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LazyColumn'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: 1000000,
        itemBuilder: (context, index) {
          return _item(index + 1);
        },
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
