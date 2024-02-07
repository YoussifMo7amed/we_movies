// ignore_for_file: file_names

class CreditModel {
  List<Cast> cast = [];
  CreditModel.fromjson(Map<String, dynamic> json) {
    json['cast'].forEach((element) {
      cast.add(Cast.fromjson(element));
    });
  }
}

class Cast {
  String? name;
  String? profilePath;

  Cast.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    profilePath = json['profile_path'];
  }
}
