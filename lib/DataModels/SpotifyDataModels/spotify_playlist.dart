import 'package:motiv_prototype/DataModels/SpotifyDataModels/spotify_image.dart';
import 'package:motiv_prototype/DataModels/SpotifyDataModels/spotify_owner.dart';
import 'package:motiv_prototype/DataModels/SpotifyDataModels/spotify_tracks.dart';

class SpotifyPlaylist {
  bool collaborative;
  String description;
  String href;
  String id;
  SpotifyImage image;
  String name;
  SpotifyOwner owner;
  bool isPublic;
  String snapshotId;
  SpotifyTracks tracks;
  String type;
  String uri;

  SpotifyPlaylist({
    required this.collaborative,
    required this.description,
    required this.href,
    required this.id,
    required this.image,
    required this.name,
    required this.owner,
    required this.isPublic,
    required this.snapshotId,
    required this.tracks,
    required this.type,
    required this.uri,
  });

  factory SpotifyPlaylist.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> tracksJson = json['tracks'];
    final SpotifyTracks tracks = SpotifyTracks.fromJson(tracksJson);

    final List<dynamic> imagesJson = json['images'];
    final List<SpotifyImage> images =
        imagesJson.map((dynamic item) => SpotifyImage.fromJson(item)).toList();
    final SpotifyImage image = images[0];

    final Map<String, dynamic> ownerJson = json['owner'];
    final SpotifyOwner owner = SpotifyOwner.fromJson(ownerJson);

    return SpotifyPlaylist(
      id: json['id'],
      name: json['name'],
      image: image,
      collaborative: json['collaborative'],
      description: json['description'],
      href: json['href'],
      owner: owner,
      isPublic: json['public'],
      snapshotId: json['snapshot_id'],
      tracks: tracks,
      type: json['type'],
      uri: json['uri'],
    );
  }
}
