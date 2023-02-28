import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            transform: const GradientRotation(120),
            colors: [Colors.pink.shade600, Colors.indigo.shade600],
          ),
        ),
        child: child);
  }
}
