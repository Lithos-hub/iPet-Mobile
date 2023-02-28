import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ipet_mobile/theme/app_theme.dart';
import 'package:ipet_mobile/widgets/widgets.dart';

class HomeBackground extends StatelessWidget {
  HomeBackground({super.key});

  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.1, 0.7],
      colors: [AppTheme.primary, AppTheme.secondary],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration,
        ),
        const Positioned(
          bottom: -50,
          right: -40,
          child: _PawIcon(),
        )
      ],
    );
  }
}

class _PawIcon extends StatelessWidget {
  const _PawIcon();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: SizedBox(
        width: 400,
        height: 400,
        child: GradientIcon(
            Icons.pets,
            400,
            LinearGradient(
              colors: <Color>[
                AppTheme.secondarySoft,
                AppTheme.primarySoft,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            )),
      ),
    );
  }
}
