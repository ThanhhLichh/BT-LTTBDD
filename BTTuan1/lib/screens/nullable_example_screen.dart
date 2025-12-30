import 'package:flutter/material.dart';

class NullableExampleScreen extends StatefulWidget {
  const NullableExampleScreen({super.key});

  @override
  State<NullableExampleScreen> createState() => _NullableExampleScreenState();
}

class _NullableExampleScreenState extends State<NullableExampleScreen> {
  final TextEditingController _controller = TextEditingController();
  String? name;

  void showName() {
    final input = _controller.text.trim();
    setState(() {
      name = input.isEmpty ? null : input;
    });
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nullable Demo")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Nhập tên",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: showName,
              child: const Text("Hiển thị"),
            ),
            const SizedBox(height: 30),
            Text(
              "Tên của bạn là: ${name?.toString() ?? "null"}",
              // name! -> crash
              style: const TextStyle(fontSize: 22),
            )

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
