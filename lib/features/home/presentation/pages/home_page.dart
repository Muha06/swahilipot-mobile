import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IntrinsicWidth(
          child: Image.asset(
            'assets/images/logos/swahilipot-logo.png',
            height: 24,
          ),
        ),
      ),

      body: const Placeholder(),
    );
  }
}
