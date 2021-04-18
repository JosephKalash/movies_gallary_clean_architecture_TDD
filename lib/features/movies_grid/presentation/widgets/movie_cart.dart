import 'package:flutter/material.dart';
import 'package:movies_gallery/core/utls/func.dart';

import '../../domain/entites/movie.dart';
import '../pages/movie_details_screen.dart';

class MovieCart extends StatelessWidget {
  final Movie movie;

  const MovieCart(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          header: Padding(
            padding: EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red.shade900,
                  child: Text(
                    '${movie.voteAverage}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                MovieDetailScreen.NAME,
                arguments: {
                  'name': movie.title,
                  'id': movie.id,
                },
              );
            },
            child: movie.posterUrl!.isEmpty
                ? Text('There is no poster')
                : Image.network(
                    movie.posterUrl!,
                    errorBuilder: (_, _a, _b) => Text('There is no poster'),
                  ),
          ),
          footer: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTileBar(
              backgroundColor: Colors.red.withOpacity(0.8),
              title: Text(
                movie.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                '${formateGenres(movie.genres)}',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
