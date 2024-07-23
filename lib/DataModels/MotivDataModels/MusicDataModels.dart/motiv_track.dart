import 'package:cloud_firestore/cloud_firestore.dart';

class MotivTrack {
  final String source;
  final String id;
  final String itemID;
  final String name;
  final String queuedBy;
  final String artists;
  final String albumCoverURL;
  final int durationMs;
  final Timestamp timeAdded;
  Timestamp? timePlayed;
  List<String> upvotes;
  List<String> downvotes;

  MotivTrack({
    required this.source,
    required this.id,
    required this.itemID,
    required this.name,
    required this.queuedBy,
    required this.artists,
    required this.albumCoverURL,
    required this.durationMs,
    required this.timeAdded,
    Timestamp? timePlayed,
    List<String>? upvotes,
    List<String>? downvotes,
  })  : upvotes = upvotes ?? [],
        downvotes = downvotes ?? [];

  @override
  String toString() {
    return 'MotivTrack(\n'
        '  source: $source,\n'
        '  id: $id,\n'
        '  itemID: $itemID,\n'
        '  name: $name,\n'
        '  queuedBy: $queuedBy,\n'
        '  artists: $artists,\n'
        '  albumCoverURL: $albumCoverURL,\n'
        '  durationMs: $durationMs,\n'
        '  durationMs: $timeAdded,\n'
        '  timePlayed: $timePlayed,\n'
        '  upvotes: $upvotes,\n'
        '  downvotes: $downvotes\n'
        ')';
  }
}
