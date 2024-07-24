import 'package:cloud_firestore/cloud_firestore.dart';

class QueueItemData {
  late String trackId;
  late String source;
  late Timestamp timeAdded;
  late bool hasPlayed;
  String? addedBy; // Depending on your data, this might be optional
  int? songProgress;
  Timestamp? lastProgressUpdate;

  QueueItemData({
    required this.trackId,
    required this.source,
    required this.timeAdded,
    this.addedBy,
  });

  QueueItemData.fromJson(Map<String, dynamic> json) {
    trackId = json['trackID'];
    source = json['source'];
    timeAdded = Timestamp(
      json['timeAdded']['_seconds'],
      json['timeAdded']['_nanoseconds'],
    );
    addedBy = json['addedBy'];
    hasPlayed = json['hasPlayed'];
    songProgress = json['songProg'];
    lastProgressUpdate = json['lastProgUpdate'];
  }
}
