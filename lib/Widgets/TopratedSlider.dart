import 'package:flutter/material.dart';
import 'package:movieapp/Pages/DetailsScreen.dart';
import 'package:movieapp/Utils/constants.dart';


class MoviesSlider extends StatelessWidget {
  const MoviesSlider({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final List<Map<String, dynamic>> snapshot;

  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getSliderItemWidth(BuildContext context) {
    return getScreenWidth(context) * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.length,
        itemBuilder: (context, index) {
          var movie = snapshot[index];
          return buildMovieItem(context, movie);
        },
      ),
    );
  }

  Widget buildMovieItem(BuildContext context, Map<String, dynamic> movie) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsScreen(movie: movie)),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 300,
            width: getSliderItemWidth(context),
            child: buildImageWidget(movie),
          ),
        ),
      ),
    );
  }

  Widget buildImageWidget(Map<String, dynamic> movie) {
    return Image.network(
      '${Constants.imagePath}${movie['poster_path']}',
      filterQuality: FilterQuality.high,
      fit: BoxFit.cover,
    );
  }
}
