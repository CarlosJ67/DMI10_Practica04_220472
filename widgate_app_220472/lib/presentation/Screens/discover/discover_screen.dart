import 'package:flutter/material.dart';

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Aqui se cargaran los videos de la seccion -Descubrir-',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}