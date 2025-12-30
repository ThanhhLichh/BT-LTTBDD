import 'package:flutter/material.dart';

class Practice4Screen extends StatefulWidget {
  const Practice4Screen({super.key});

  @override
  State<Practice4Screen> createState() => _Practice4ScreenState();
}

class _Practice4ScreenState extends State<Practice4Screen> {
  final TextEditingController _emailController = TextEditingController();
  String message = "";

  void checkEmail() {
    final email = _emailController.text.trim();

    setState(() {
      if (email.isEmpty) {
        message = "Email không hợp lệ";
      } else if (email.split("@").length != 2) {
        message = "Email không đúng định dạng";
      } else {
        message = "Bạn đã nhập email hợp lệ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Thực hành 02"),

            const SizedBox(height: 20),

            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              message,
              style: TextStyle(
                color: message == "Bạn đã nhập email hợp lệ"
                    ? Colors.green
                    : Colors.red,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: checkEmail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Kiểm tra",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
