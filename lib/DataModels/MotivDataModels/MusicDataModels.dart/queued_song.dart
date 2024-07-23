import 'package:motiv_prototype/DataModels/MotivDataModels/MusicDataModels.dart/song_votes.dart';

class QueuedSong {
  final String source;
  final String id;
  final SongVotes votes;
  final String timeAdded;
  final String addedBy;

  QueuedSong({
    required this.source,
    required this.id,
    required this.votes,
    required this.timeAdded,
    required this.addedBy,
  });

  factory QueuedSong.fromJson(Map<String, dynamic> json) {
    return QueuedSong(
      source: json['source'],
      id: json['id'],
      votes: SongVotes.fromJson(json['votes']),
      timeAdded: json['timeAdded'],
      addedBy: json['addedBy'],
    );
  }
}
