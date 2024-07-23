class SpotifyImage {
  int? height;
  int? width;
  String url;

  SpotifyImage({
    required this.height,
    required this.width,
    required this.url,
  });

  factory SpotifyImage.fromJson(Map<String, dynamic> json) {
    return SpotifyImage(
      height: json['height'],
      width: json['width'],
      url: json['url'],
    );
  }
}
