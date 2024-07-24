import 'package:motiv_prototype/DataModels/SpotifyDataModels/spotify_album.dart';
import 'package:motiv_prototype/DataModels/SpotifyDataModels/spotify_artist.dart';

class SpotifyTrack {
  String id;
  String name;
  List<SpotifyArtist> artists;
  SpotifyAlbum album;
  int durationMs;
  String uri;
  String? previewUrl;

  SpotifyTrack({
    required this.id,
    required this.name,
    required this.artists,
    required this.album,
    required this.durationMs,
    required this.uri,
    this.previewUrl,
  });

  factory SpotifyTrack.fromJson(Map<String, dynamic> json) {
    return SpotifyTrack(
      id: json['id'],
      name: json['name'],
      artists: List<SpotifyArtist>.from(
        json['artists'].map(
          (artistJson) => SpotifyArtist.fromJson(artistJson),
        ),
      ),
      album: SpotifyAlbum.fromJson(json['album']),
      durationMs: json['duration_ms'],
      uri: json['uri'],
      previewUrl: json['preview_url'],
    );
  }
}
