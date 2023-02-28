import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ipet_mobile/theme/app_theme.dart';

class HomeCardTable extends StatelessWidget {
  const HomeCardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _SingleCard(
              onTap: () => Navigator.pushNamed(context, 'pet'),
              icon: Icons.pets,
              text: 'Mi mascotas',
            ),
            _SingleCard(
              onTap: () => Navigator.pushNamed(context, 'calendar'),
              icon: Icons.calendar_month,
              text: 'Mi calendario',
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
                onTap: () => Navigator.pushNamed(context, 'agenda'),
                icon: Icons.view_agenda,
                text: 'Mi Agenda'),
            _SingleCard(
              onTap: () => Navigator.pushNamed(context, 'settings'),
              icon: Icons.settings,
              text: 'Configuración',
            ),
          ],
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  const _SingleCard({required this.icon, required this.text, this.onTap});

  final IconData icon;
  final String text;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.centerRight,
                  colors: [
                    AppTheme.primary.withOpacity(0.5),
                    AppTheme.primary.withOpacity(0.2)
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: _InnerCardWrapper(icon: icon, text: text),
            ),
          ),
        ),
      ),
    );
  }
}

class _InnerCardWrapper extends StatelessWidget {
  const _InnerCardWrapper({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            color: Colors.pink.shade400,
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomRight,
            //   colors: [
            //     color.withOpacity(1),
            //     color.withOpacity(0.5),
            //   ],
            // ),
          ),
          child: Icon(icon, size: 30, color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }
}
