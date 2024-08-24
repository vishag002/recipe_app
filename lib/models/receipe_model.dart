class Recipie {
  final String? name;
  final String? images;
  final double? rating;
  final String? totalTime;
  final String? authorName;
  final String? url;

  Recipie({
    this.name,
    this.images,
    this.rating,
    this.totalTime,
    this.authorName,
    this.url,
  });

  factory Recipie.fromJson(Map<String, dynamic> json) {
    return Recipie(
      name: json['name'] as String?,
      images: json['images'] != null && json['images'].isNotEmpty
          ? json['images'][0]['hostedLargeUrl'] as String?
          : null,
      rating:
          json['rating'] != null ? (json['rating'] as num).toDouble() : null,
      totalTime: json['totalTime'] as String?,
      authorName: json['displayName'] as String?,
      url: json['directionsUrl'] as String?,
    );
  }

  static List<Recipie> recipiesFromSnapshot(List<dynamic> snapshot) {
    return snapshot.map((data) => Recipie.fromJson(data)).toList();
  }

  @override
  String toString() {
    return 'Recipie {name: $name, images: $images, rating: $rating, time: $totalTime, authorName: $authorName,url:$url}';
  }
}
