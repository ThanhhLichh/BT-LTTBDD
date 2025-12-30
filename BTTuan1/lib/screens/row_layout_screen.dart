import 'package:flutter/material.dart';

class RowLayoutScreen extends StatelessWidget {
  const RowLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Row Layout',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _rowContainer(),
            const SizedBox(height: 16),
            _rowContainer(),
            const SizedBox(height: 16),
            _rowContainer(),
            const SizedBox(height: 16),
            _rowContainer(),
          ],
        ),
      ),
    );
  }

  Widget _rowContainer() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFF2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _box(color: const Color(0xFFAEC7F5)),
          const SizedBox(width: 12),
          _box(color: const Color(0xFF5A8DEE)), // ô giữa
          const SizedBox(width: 12),
          _box(color: const Color(0xFFAEC7F5)),

        ],
      ),
    );
  }

  Widget _box({required Color color}) {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
