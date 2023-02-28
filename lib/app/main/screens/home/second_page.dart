import 'package:flutter/material.dart';

import 'package:ipet_mobile/widgets/home_card_table.dart';
import 'package:ipet_mobile/widgets/widgets.dart';

class HomeSecondPage extends StatelessWidget {
  const HomeSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HomeBackground(),
        SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: const HomeCardTable(),
          ),
        )
      ],
    );
  }
}
