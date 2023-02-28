import 'package:flutter/material.dart';
import 'package:ipet_mobile/app/main/screens/home/first_page.dart';
import 'package:ipet_mobile/app/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: const [
          HomeFirstPage(),
          HomeSecondPage(),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Background'),
      ),
    );
  }
}
