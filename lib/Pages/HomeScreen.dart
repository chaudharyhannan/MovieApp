import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/Service/MovieController.dart';
import 'package:movieapp/Widgets/TopratedSlider.dart';
import 'package:movieapp/Widgets/TrendingSlider.dart';



class HomeScreen extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  double getVerticalPadding(BuildContext context, double topPadding, double bottomPadding) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * topPadding / 600 + bottomPadding; // Adjust 600 to your preference
  }
  double getFontSize(BuildContext context, double baseFontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    return baseFontSize * screenWidth / 375; // Adjust 375 to your preference
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  Text("MovieFlix",
          style: GoogleFonts.monda(
              fontSize: getFontSize(context, 38),
              fontWeight: FontWeight.w600,
            color: Colors.amber
          ),

        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "Trending Movies",
                style: GoogleFonts.monda(
                    fontSize: getFontSize(context, 20),
                    fontWeight: FontWeight.w600,
                ),              ),
              const SizedBox(height: 32,),
              SizedBox(
                child: Obx(() {
                  if (movieController.trendingMovies.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return TrendingSlider(snapshot: movieController.trendingMovies);
                  }
                }),
              ),
              const SizedBox(height: 30,),
               Text(
                "TopRated Movies",
                style: GoogleFonts.monda(
                  fontSize: getFontSize(context, 20),
                  fontWeight: FontWeight.w600,
                ),                   ),
              const SizedBox(height: 32,),
              SizedBox(
                child: Obx(() {
                  if (movieController.topratedMovies.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return MoviesSlider(snapshot: movieController.topratedMovies);
                  }
                }),
              ),
              const SizedBox(height: 30,),
               Text(
                "UpComing Movies",
                 style: GoogleFonts.monda(
                   fontSize: getFontSize(context, 20),
                   fontWeight: FontWeight.w600,
                 ),
               ),
              const SizedBox(height: 32,),


              SizedBox(
                child: Obx(() {
                  if (movieController.upcomingMovies.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return MoviesSlider(snapshot: movieController.upcomingMovies);
                  }
                }),
              ),

              // ... other sections ...
            ],
          ),
        ),
      ),
    );
  }
}
