import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      Text("iPet",
          style: TextStyle(
              color: Colors.white, fontSize: 90, fontWeight: FontWeight.w500)),
      Icon(Icons.pets, color: Colors.white, size: 80),
    ]);
  }
}
