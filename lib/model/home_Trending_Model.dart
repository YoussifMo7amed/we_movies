// ignore_for_file: file_names

class TrendingModel{
  int? page;
 List<Result> result=[];

 TrendingModel.fromjson(Map<String,dynamic>json){
  page=json['page'];
json['results'].forEach((element) {
    result.add(Result.fromjson(element));
  });
 }
}
class Result {
    bool ?adult;
    String? backdropPath;
    int? id;
      List<dynamic> genres = [];

    String? originalLanguage;
    String? originalTitle;
    String ?overview;
    double ?popularity;
    String ?posterPath;
    String? releaseDate;
    String ?title;
    bool ?video;
    double? voteAverage;
    int ?voteCount;

 Result.fromjson(Map<String,dynamic>json){
     genres=json['genre_ids'];
     adult=json['adult'];
     backdropPath=json['backdrop_path'];
    id=json['id'];
     originalLanguage=json['originalLanguage'];
     originalTitle=json['original_title'];
     overview=json['overview'];
     popularity=json['popularity'];
 posterPath=json['poster_path'];
  releaseDate=json['release_date'];
   title=json['title'];
     video=json['video'];
  voteAverage=json['vote_average'];
     voteCount=json['vote_count'];
}

}
