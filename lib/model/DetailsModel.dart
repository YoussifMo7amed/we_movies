
// ignore_for_file: file_names

class DetailsMoviesModel {
  String? backdropPath;
  List<Genre> genres = [];
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? title;

  DetailsMoviesModel.fromjson(Map<String, dynamic> json) {
    json['genres'].forEach((element) {
      genres.add(Genre.fromjson(element));
    });
    backdropPath=json['backdrop_path'];
     id=json['id'];
     originalLanguage=json['original_language'];
     originalTitle=json['original_title'];
     overview=json['overview'];
     posterPath=json['poster_path'];
     title=json['title'];
  }
}

class Genre {
  int? id;
  String? name;

  Genre.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
