import 'package:flutter/material.dart';

import 'screens/choose_list_type_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List Performance Demo',
      home: const ChooseListTypeScreen(),
    );
  }
}
