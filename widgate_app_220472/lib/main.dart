import 'package:flutter/material.dart';
import 'package:widgate_app_220472/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 3).getTheme(),
      home: Scaffold( // appBar
        appBar: AppBar(title: const Text('Widgate App - 220472')),
        body: Center(
          child: FilledButton(onPressed: (){}, child: Text('Click me!')),
        ),
      ),
    );
  }
}
