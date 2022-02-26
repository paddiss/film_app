import 'package:film_app/card.dart';
import 'package:film_app/constant.dart';
import 'package:film_app/filter.dart';
import 'package:film_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiServices api = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film App'),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Top Rate Movies',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 22,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.filter),
                    onPressed: () {
                      Get.to(const FilterMinMax());
                    }),
              ],
            ),
          ),
          Expanded(
            child: ListView(children: [
              Container(
                color: Colors.grey[300],
                child: Obx(
                  () => StaggeredGrid.count(
                    crossAxisCount: 2,
                    children: movieController.movieList
                        .map((movie) => MovieCard(movie: movie))
                        .toList(),
                  ),
                ),
              ),
            ]),
          ),

          // // Container(child: movieTemplate(movie)),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: movies.length,
          //     itemBuilder: (context, index) {
          //       return MovieCard(movie: movies[index]);
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
