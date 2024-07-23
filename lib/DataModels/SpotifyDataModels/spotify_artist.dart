class SpotifyArtist {
  String id;
  String name;

  SpotifyArtist({
    required this.id,
    required this.name,
  });

  factory SpotifyArtist.fromJson(Map<String, dynamic> json) {
    return SpotifyArtist(
      id: json['id'],
      name: json['name'],
    );
  }
}
