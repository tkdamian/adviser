import 'package:flutter/material.dart';

class AdviserPage extends StatelessWidget {
  const AdviserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Adviser"),
        ),
        body: const Center(child: Text("Your Advice is waiting for you!")));
  }
}
