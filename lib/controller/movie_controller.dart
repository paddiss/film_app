import 'package:film_app/model/movieapi_model.dart';
import 'package:film_app/services/api_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MovieController extends GetxController {
  static MovieController instance = Get.find();

  var movieList = [].obs;
  var movieListFilter = [].obs;
  var movieVideos = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovie();
  }

  void fetchMovie() async {
    var movieApi = await ApiServices.fetchMovies();
    if (movieApi != null) {
      movieList.value = movieApi.results;
    }
  }

  void filtMinYean(
    int min,
    int max,
  ) {
    // print(min);
    // print(max);
    var list = [];
    for (Result movie in movieList) {
      String time = DateFormat(
        'yyyy',
      ).format(movie.releaseDate);
      int timeRelease = int.parse(time);
      if (timeRelease > min && timeRelease < max) {
        list.add(movie);
      }
    }
    movieListFilter.value = list;
  }
}
