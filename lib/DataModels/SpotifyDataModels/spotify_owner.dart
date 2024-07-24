class SpotifyOwner {
  String displayName;
  String href;
  String id;
  String type;
  String uri;

  SpotifyOwner({
    required this.displayName,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
  });

  factory SpotifyOwner.fromJson(Map<String, dynamic> json) {
    return SpotifyOwner(
      displayName: json['display_name'],
      href: json['href'],
      id: json['id'],
      type: json['type'],
      uri: json['uri'],
    );
  }
}
