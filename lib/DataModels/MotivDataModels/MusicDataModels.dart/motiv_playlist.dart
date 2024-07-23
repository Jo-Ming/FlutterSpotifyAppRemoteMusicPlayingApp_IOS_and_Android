import 'package:motiv_prototype/DataModels/MotivDataModels/MusicDataModels.dart/motiv_track.dart';

class MotivPlaylist {
  String name;
  String id;
  final String playlistProtectionLevel;
  String description;
  final String imageURL;
  final String owner;
  List<MotivTrack> trackList;
  final List<String> userList;

  MotivPlaylist({
    required this.playlistProtectionLevel,
    required this.description,
    required this.id,
    required this.imageURL,
    required this.name,
    required this.owner,
    required this.trackList,
    required this.userList,
  });
}
