import 'package:flutter/material.dart';

class TextDetailScreen extends StatelessWidget {
  const TextDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Text Detail',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
      ),

      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,

            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 32,
                color: Colors.black,
                height: 1.7,
              ),
              children: [
                const TextSpan(text: 'The '),
                const TextSpan(
                  text: 'quick ',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const TextSpan(
                  text: 'Brown\n',
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 36,
                  ),
                ),

                const TextSpan(text: 'fox '),
                const TextSpan(
                  text: 'jumps ',
                  style: TextStyle(
                    letterSpacing: 6,
                  ),
                ),
                const TextSpan(
                  text: 'over\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const TextSpan(
                  text: 'the ',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.6,
                    height: 1,
                  ),
                ),

                const TextSpan(
                  text: 'lazy ',
                  style: TextStyle(
                    fontFamily: 'cursive',
                    fontStyle: FontStyle.italic,
                    fontSize: 26,
                  ),
                ),
                const TextSpan(text: 'dog.'),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),

    );
  }
}
