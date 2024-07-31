import 'package:flutter/material.dart';
import 'package:uts/secondpage.dart';
import 'movie_item.dart'; 


class Movie extends StatefulWidget {
  const Movie({super.key});

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  final List<Map<String, String>> _movies = [
    {
      'imageUrl': 'https://m.media-amazon.com/images/M/MV5BNzRiMjg0MzUtNTQ1Mi00Y2Q5LWEwM2MtMzUwZDU5NmVjN2NkXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
      'title': 'DeadPool And Wolverine',
    },
    {
      'imageUrl': 'https://m.media-amazon.com/images/M/MV5BODA5MTY0OWUtNjdlOC00NDI5LWE3NjYtNDM4MDI2MzE4OWUxXkEyXkFqcGdeQXVyOTAzODkzMjI@._V1_FMjpg_UX1000_.jpg',
      'title': 'Spiderman Far From Home',
    },
    {
      'imageUrl': 'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_FMjpg_UX1000_.jpg',
      'title': 'Avengers Infinity Wars',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 231, 221),
      appBar: AppBar(title: const Text("Movie List"),backgroundColor: const Color.fromARGB(255, 222, 231, 221),),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView.builder(
            itemCount: _movies.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = _movies[index];
              return MovieItem(
                imageUrl: movie['imageUrl']!,
                title: movie['title']!,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SecondPage(heroTag: index),
                  ));
                },
                heroTag: index,
              );
            },
          ),
        ),
      ),
    );
  }
}