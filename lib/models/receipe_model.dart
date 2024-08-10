class Recipie {
  final String? name;
  final String? images;
  final double? rating;
  final String? totalTime;
  final String? authorName;
  Recipie(
      {this.name, this.images, this.rating, this.totalTime, this.authorName});

  factory Recipie.fromJson(dynamic json) {
    return Recipie(
      name: json['name'] as String,
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String,
      authorName: json['displayName'] as String,
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
    return 'Recipie {name: $name , images: $images , rating:$rating, time:$totalTime , authorName:$authorName}';
  }
}
