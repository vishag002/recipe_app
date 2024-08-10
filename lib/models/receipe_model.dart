class Recipie {
  final String? name;
  final String? images;
  final double? rating;
  final String? totalTime;
  Recipie({this.name, this.images, this.rating, this.totalTime});

  factory Recipie.fromJson(dynamic json) {
    return Recipie(
      name: json['name'] as String,
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String,
    );
  }

  //

  static List<Recipie> recipiesFromSnapshot(List snapshot) {
    return snapshot.map(
      (data) {
        return Recipie.fromJson(data);
      },
    ).toList();
  }

  @override
  String toString() {
    return 'Recipie {name: $name , images: $images , rating:$rating, time:$totalTime}';
  }
}
