import 'package:motiv_prototype/DataModels/SpotifyDataModels/spotify_image.dart';

class SpotifyAlbum {
  String id;
  String name;
  List<SpotifyImage> images;

  SpotifyAlbum({
    required this.id,
    required this.name,
    required this.images,
  });

  factory SpotifyAlbum.fromJson(Map<String, dynamic> json) {
    final List<dynamic> imagesJson = json['images'];
    final List<SpotifyImage> images =
        imagesJson.map((dynamic json) => SpotifyImage.fromJson(json)).toList();

    return SpotifyAlbum(
      id: json['id'],
      name: json['name'],
      images: images,
    );
  }
}
