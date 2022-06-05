class Carrosel {
  final int id;
  final Images? images;

  Carrosel({required this.id, required this.images});

  factory Carrosel.fromJson(Map<String, dynamic> json) => Carrosel(
      id: json['id'],
      images: json['images'] != null ? Images.fromJson(json['images']) : null);

  Map<String, dynamic> toJson() => {
        'id': id,
        'images': images?.toJson(),
      };
}

class Images {
  final int id;
  final String url;

  Images({required this.id, required this.url});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json['id'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
      };
}
