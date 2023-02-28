import 'package:flutter/material.dart';

class PetDetailScreen extends StatelessWidget {
  const PetDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String pet =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'No pet data';
    return const Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.blueGrey,
      expandedHeight: 150,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              transform: const GradientRotation(120),
              colors: [
                Colors.pink.shade600.withOpacity(0.5),
                Colors.indigo.shade600.withOpacity(0.5)
              ],
            ),
          ),
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          child: const Text(
            'pet.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/500x300'),
            fit: BoxFit.cover),
      ),
    );
  }
}
