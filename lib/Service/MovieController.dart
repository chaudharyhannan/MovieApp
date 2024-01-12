import 'package:get/get.dart';
import 'package:movieapp/Service/MovieService.dart';

class MovieController extends GetxController {
  var trendingMovies = <Map<String, dynamic>>[].obs;
  var topratedMovies = <Map<String, dynamic>>[].obs;
  var upcomingMovies = <Map<String, dynamic>>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchTrendingMovies();
    fetchTopRatedMovies();
    fetchUpComingMovies();
  }

  void fetchTrendingMovies() async {
    try {
      var response = await MovieService().fetchTrendingMovies();
      var results = response['results'] as List<dynamic>;

      // Make sure the items in results are of type Map<String, dynamic>
      trendingMovies.assignAll(results.cast<Map<String, dynamic>>());
    } catch (error) {
      // Handle error, show error message, or log
      print('Error fetching trending movies: $error');
    }
  }

  void fetchTopRatedMovies() async {
    try {
      var response = await MovieService().fetchTopRatedMovies();
      var results = response['results'] as List<dynamic>;

      // Make sure the items in results are of type Map<String, dynamic>
      topratedMovies.assignAll(results.cast<Map<String, dynamic>>());
    } catch (error) {
      // Handle error, show error message, or log
      print('Error fetching toprated movies: $error');
    }
  }



  void fetchUpComingMovies() async {
    try {
      var response = await MovieService().fetchUpComingMovies();
      var results = response['results'] as List<dynamic>;

      // Make sure the items in results are of type Map<String, dynamic>
      upcomingMovies.assignAll(results.cast<Map<String, dynamic>>());
    } catch (error) {
      // Handle error, show error message, or log
      print('Error fetching upcoming movies: $error');
    }
  }
}
