import 'package:flutter/material.dart';
import 'package:ipet_mobile/widgets/home_card_table.dart';
import 'package:ipet_mobile/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeBackground(),
          SafeArea(
            child: Column(
              children: const [
                HeaderCard(
                    title: "Próximas citas",
                    noDataMessage: "No tienes próximas citas",
                    card: AppointmentCard()),
                SizedBox(height: 20),
                HeaderCard(
                    title: "Notas importantes",
                    noDataMessage: "No tienes notas importantes",
                    card: NotesCard()),
                HomeCardTable(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    super.key,
    required this.title,
    required this.noDataMessage,
    required this.card,
  });

  final String title;
  final String noDataMessage;
  final Widget card;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              children: [
                Text(title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                card
              ],
            ),
          ),
        )
      ],
    );
  }
}

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("28 de junio",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade700)),
        const Text("Cita con el veterinario", style: TextStyle(fontSize: 20)),
      ],
    );
  }
}

class NotesCard extends StatelessWidget {
  const NotesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Esto es una nota", style: TextStyle(fontSize: 20)),
      ],
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
