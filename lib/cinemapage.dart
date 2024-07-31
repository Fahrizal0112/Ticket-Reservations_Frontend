import 'package:flutter/material.dart';

class CinemaPage extends StatelessWidget {
  const CinemaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> cinemas = [
      'XXI Paris Van Java',
      'Cinepolis Trans Studio Mall',
      'CGV Blitz Ciwalk',
      'Cineworld Bandung',
      'Cinemaxx Bandung',
      'Grand XXI Bandung',
      'Bioskop 21 Bandung',
      'Blitzmegaplex Bandung',
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 231, 221),
      appBar: AppBar(
        title: const Text('Daftar Bioskop'),
        backgroundColor: const Color.fromARGB(255, 222, 231, 221),
      ),
      body: ListView.builder(
        itemCount: cinemas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cinemas[index]),
            leading: const Icon(Icons.movie_creation_outlined),
            contentPadding: const EdgeInsets.all(16.0),
          );
        },
      ),
    );
  }
}