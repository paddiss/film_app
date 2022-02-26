import 'package:film_app/model/movieapi_model.dart';
import 'package:film_app/model/movie_model.dart' as videosresult;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetail extends StatelessWidget {
  final Result movie;
  final List<videosresult.Result> movieVideos;
  const MovieDetail({Key? key, required this.movie, required this.movieVideos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    videosresult.Result? trailer;
    for (var video in movieVideos) {
      if (video.type == "Trailer") {
        trailer = video;
      }
    }
    String time = DateFormat(
      'dd/MM/yyyy ',
    ).format(movie.releaseDate);
    YoutubePlayerController _controller;

    if (trailer != null) {
      _controller = YoutubePlayerController(
        initialVideoId: trailer.key,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: true,
        ),
      );
    } else {
      _controller = YoutubePlayerController(
        initialVideoId: '4YKpBYo61Cs',
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: true,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Card(
              color: Colors.grey[200],
              margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: ListView(children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Release Date',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'OverView',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(movie.overview),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Trailer',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (trailer == null) const Text(' Không có trailer'),
                      if (trailer != null)
                        YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                          onReady: () {
                            debugPrint('player is ready');
                          },
                        ),
                    ],
                  ),
                ),
              ]))
        ],
      ),
    );
  }
}
