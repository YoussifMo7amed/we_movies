class Message {
  final String image;

  final String name;
  final String date;
  final String phone;
  final String country;
  Message(
      {required this.image,
      required this.name,
      required this.date,
      required this.phone,
      required this.country});

  factory Message.fromjson(jsondata) {
    return Message(
        image: jsondata['image'],
        name: jsondata['name'],
        date: jsondata['date'],
        country: jsondata['country'],
        phone: jsondata['phone']);
  }
}
