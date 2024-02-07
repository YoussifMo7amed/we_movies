// ignore_for_file: file_names

class VideoModel{
 List<Result> result=[];

 VideoModel.fromjson(Map<String,dynamic>json){
json['results'].forEach((element) {
    result.add(Result.fromjson(element));
  });
 }
}
class Result {
    String?key;
    String ?name;

 Result.fromjson(Map<String,dynamic>json){
     key=json['key'];
     name=json['name'];
}

}
