import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.appBar});
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar, body: const Text('Home'));
  }
}
