import 'package:flutter/material.dart';
import 'package:ipet_mobile/theme/app_theme.dart';

class HomeFirstPage extends StatelessWidget {
  const HomeFirstPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: const [Background(), MainContent()]);
  }
}

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF18262C),
      height: double.infinity,
      child: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.2),
              AppTheme.primary.withOpacity(0.5)
            ]).createShader(bounds),
        child: const Image(
          image: AssetImage('assets/image-1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Column(
            children: [
              const Text(
                'Bienvenido a ',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'iPet',
                    style: TextStyle(fontSize: 70, color: Colors.white),
                  ),
                  Icon(Icons.pets, color: AppTheme.primary, size: 50),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Próxima cita",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: const HeaderCard(
                    noDataMessage: "No tienes próximas citas",
                    card: AppointmentCard()),
              ),
              const SizedBox(height: 20),
              const Text(
                "Notas importantes",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const HeaderCard(
                  noDataMessage: "No tienes notas importantes",
                  card: NotesCard()),
            ],
          ),
          Expanded(child: Container()),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 50)
        ],
      ),
    );
  }
}

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    super.key,
    required this.noDataMessage,
    required this.card,
  });

  final String noDataMessage;
  final Widget card;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: card,
    );
  }
}

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "28 de junio",
            style: TextStyle(
                fontSize: 40,
                color: AppTheme.primary,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Cita con el veterinario",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class NotesCard extends StatelessWidget {
  const NotesCard({
    super.key,
  });

  final String note =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 150,
      // width: double.infinity,
      child: Table(
        children: [
          TableRow(
            children: [
              Note(note: note),
              Note(note: note),
            ],
          ),
          TableRow(
            children: [
              Note(note: note),
              Note(note: note),
            ],
          ),
        ],
      ),
    );
  }
}

class Note extends StatelessWidget {
  const Note({
    super.key,
    required this.note,
  });

  final String note;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "${note.substring(1, 70)}...",
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
        ));
  }
}
