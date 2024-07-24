class SpotifyUserProfile {
  final String displayName;
  final String id;
  final String country;
  final String profileImageUrl;
  final Map<String, dynamic> externalUrls;
  final String href;
  final String type;
  final String uri;
  final int followersCount;
  final String product;

  SpotifyUserProfile({
    required this.displayName,
    required this.id,
    required this.country,
    required this.profileImageUrl,
    required this.externalUrls,
    required this.href,
    required this.type,
    required this.uri,
    required this.followersCount,
    required this.product,
  });

  factory SpotifyUserProfile.fromJson(Map<String, dynamic> json) {
    final displayNames = json['display_name'] ?? '';
    final ids = json['id'] ?? '';
    final countries = json['country'] ?? '';
    final profileImages = json['images'] != null && json['images'].isNotEmpty
        ? json['images'][0]['url']
        : '';
    final externalUrls = json['external_urls'] ?? {};
    final hrefs = json['href'] ?? '';
    final types = json['type'] ?? '';
    final uris = json['uri'] ?? '';
    final followersCounts =
        json['followers'] != null ? json['followers']['total'] : 0;
    final products = json['product'] ?? '';

    return SpotifyUserProfile(
      displayName: displayNames,
      id: ids,
      country: countries,
      profileImageUrl: profileImages,
      externalUrls: externalUrls,
      href: hrefs,
      type: types,
      uri: uris,
      followersCount: followersCounts,
      product: products,
    );
  }
}
