import 'package:film_app/model/movieapi_model.dart';
import 'package:film_app/movie_detail.dart';
import 'package:film_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieCard extends StatelessWidget {
  final Result movie;

  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var movieApiVideos = await ApiServices().fetchMovieVideos(movie.id);

        Get.to(MovieDetail(
          movie: movie,
          movieVideos: movieApiVideos!.results,
        ));
      },
      child: Card(
        color: Colors.grey[200],
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image(
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
            fit: BoxFit.cover,
            height: 220,
            width: 150,
          ),
        ),
      ),
    );
  }
}
