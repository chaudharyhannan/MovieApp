import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Pages/DetailsScreen.dart';
import 'package:movieapp/Utils/constants.dart';


class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final List<Map<String, dynamic>> snapshot;

  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getSliderHeight(BuildContext context) {
    return getScreenWidth(context) * 0.7;
  }

  double getSliderItemWidth(BuildContext context) {
    return getScreenWidth(context) * 0.55;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.length,
        options: CarouselOptions(
          height: getSliderHeight(context),
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          var movie = snapshot[itemIndex];
          return buildCarouselItem(context, movie);
        },
      ),
    );
  }

  Widget buildCarouselItem(BuildContext context, Map<String, dynamic> movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsScreen(movie: movie)),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: getSliderHeight(context),
          width: getSliderItemWidth(context),
          child: buildImageWidget(movie),
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
