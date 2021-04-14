import 'package:flutter/material.dart';

import '../../domain/entites/movie.dart';

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
          child: Image.network(movie.posterUrl),
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
                '${movie.genres![0]} | ${movie.genres![1]}',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
