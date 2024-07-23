import 'package:motiv_prototype/DataModels/MotivDataModels/MusicDataModels.dart/motiv_track.dart';

class MotivMusicQueue {
  String queueID;
  List<MotivTrack> trackList;

  MotivMusicQueue({required this.queueID, required this.trackList});
}
