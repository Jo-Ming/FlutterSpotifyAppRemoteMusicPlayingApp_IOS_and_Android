import 'package:motiv_prototype/DataModels/SpotifyDataModels/spotify_track.dart';

class SpotifyTrackSearchResponse {
  String query;
  List<SpotifyTrack> tracks;

  SpotifyTrackSearchResponse({
    required this.query,
    required this.tracks,
  });

  factory SpotifyTrackSearchResponse.fromJson(Map<String, dynamic> json) {
    List<SpotifyTrack> tracks = [];

    if (json['tracks'] is Map<String, dynamic>) {
      final List<dynamic> tracksJson = json['tracks']['items'];
      tracks = tracksJson
          .map((dynamic item) =>
              SpotifyTrack.fromJson(item as Map<String, dynamic>))
          .toList();
    }

    return SpotifyTrackSearchResponse(
      query: json['query'] as String,
      tracks: tracks,
    );
  }
}
