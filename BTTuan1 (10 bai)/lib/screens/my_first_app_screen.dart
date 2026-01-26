import 'package:flutter/material.dart';

class MyFirstAppScreen extends StatefulWidget {
  const MyFirstAppScreen({super.key});

  @override
  State<MyFirstAppScreen> createState() => _MyFirstAppScreenState();
}

class _MyFirstAppScreenState extends State<MyFirstAppScreen> {
  bool saidHi = false;

  void sayHi() {
    setState(() {
      saidHi = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const Text(
                "My First App",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 120),

              saidHi
                  ? RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: "I'm\n"),
                    TextSpan(
                      text: "Bùi Thanh Lịch",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
                  : const Text(
                "Hello",
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 120),


              SizedBox(
                width: 160,
                height: 44,
                child: ElevatedButton(
                  onPressed: sayHi,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Say Hi!",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
