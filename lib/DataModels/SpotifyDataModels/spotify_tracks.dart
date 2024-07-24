class SpotifyTracks {
  String href;
  int total;

  SpotifyTracks({
    required this.href,
    required this.total,
  });

  factory SpotifyTracks.fromJson(Map<String, dynamic> json) {
    return SpotifyTracks(
      href: json['href'],
      total: json['total'],
    );
  }
}
