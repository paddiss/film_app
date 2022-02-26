import 'package:film_app/model/movie_model.dart';
import 'package:film_app/model/movieapi_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ApiServices {
  static String uriapi =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=f7b43fb7fcb594401ceeffb0ae60be57&language=en-US&page=1';
  // static var client = http.Client();

  static Future<MovieApi?> fetchMovies() async {
    try {
      Response res = await get(Uri.parse(uriapi));
      if (res.statusCode == 200) {
        // this mean that we are connected to the data base
        // print(res.body);
        // print(body);

        var movieapi = movieApiFromJson(res.body);
        // debugPrint('${movieapi.results}');
        // print("Api service: $body"); // to debug

        return movieapi;
      } else {
        throw Exception('Unable to fetch products from the REST API');
      }
    } catch (e) {
      debugPrint(' loi fetching la $e');
      return null;
    }
  }

  Future<MovieApiVideo?> fetchMovieVideos(int id) async {
    try {
      Response res = await get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$id/videos?api_key=f7b43fb7fcb594401ceeffb0ae60be57&language=en-US'));
      if (res.statusCode == 200) {
        // this mean that we are connected to the data base
        // print(res.body);
        // print(body);

        var movieApiVideo = movieApiVideoFromJson(res.body);
        // debugPrint('${movieapi.results}');
        // print("Api service: $body"); // to debug

        return movieApiVideo;
      } else {
        throw Exception('Unable to fetch products from the REST API');
      }
    } catch (e) {
      debugPrint(' loi fetching la $e');
      return null;
    }
  }
}
