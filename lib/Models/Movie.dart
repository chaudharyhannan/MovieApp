class Movie {
  String title;
  String backdropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;


  Movie({

    required this.title,
    required this.backdropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,

  });

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
        title: json["title"],
        backdropPath: json["backdropPath"],
        originalTitle: json["originalTitle"],
        overview: json["overview"],
        posterPath: json["posterPath"],
        releaseDate: json["releaseDate"],
        voteAverage: json["voteAverage"],

    );
  }
}


