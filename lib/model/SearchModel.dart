class SearchMoviesModel {
  int? page;
  List<Result> result = [];

  SearchMoviesModel.fromjson(Map<String, dynamic> json) {
    page = json['page'];
    json['results'].forEach((element) {
      result.add(Result.fromjson(element));
    });
  }
}

class Result {
  bool? adult;
  String? backdropPath;
  List<dynamic> genres = [];
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Result.fromjson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genres = json['genre_ids'];
    id = json['id'];
    originalLanguage = json['originalLanguage'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
