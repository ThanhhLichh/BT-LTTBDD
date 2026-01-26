import 'package:flutter/material.dart';
import 'column_list_screen.dart';
import 'lazy_list_screen.dart';

class ChooseListTypeScreen extends StatelessWidget {
  const ChooseListTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose List Type'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ColumnListScreen(),
                      ),
                    );
                  },
                  child: const Text('Column (1,000,000 items)'),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LazyListScreen(),
                      ),
                    );
                  },
                  child: const Text('LazyColumn (1,000,000 items)'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
