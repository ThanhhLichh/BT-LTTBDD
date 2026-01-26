import 'package:flutter/material.dart';

class BoxLayoutScreen extends StatelessWidget {
  const BoxLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Box Layout',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFEFEFF2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: _box(
                      size: 100,
                      color: const Color(0xFFFFB199),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: _box(
                      size: 100,
                      color: const Color(0xFFFFB199),
                    ),
                  ),
                  _box(
                    size: 110,
                    color: const Color(0xFFFF6A3D),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }

  Widget _box({required double size, required Color color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
