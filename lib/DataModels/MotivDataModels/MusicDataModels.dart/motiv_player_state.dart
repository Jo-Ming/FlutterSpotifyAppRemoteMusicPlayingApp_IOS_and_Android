import 'package:motiv_prototype/DataModels/MotivDataModels/MusicDataModels.dart/motiv_track.dart';

class MotivPlayerState {
  final String source;
  final Map<String, dynamic> device;
  final int timestamp;
  final Map<String, dynamic> context;
  final int progressMs;
  final MotivTrack motivTrack;
  final String currentlyPlayingType;
  final Map<String, dynamic> actions;
  bool isPlaying;

  MotivPlayerState({
    required this.source,
    required this.device,
    required this.timestamp,
    required this.context,
    required this.progressMs,
    required this.motivTrack,
    required this.currentlyPlayingType,
    required this.actions,
    required this.isPlaying,
  });

  factory MotivPlayerState.fromJson(Map<String, dynamic> json, String source) {
    return MotivPlayerState(
      source: "source",
      device: json['device'] ?? {},
      timestamp: json['timestamp'] ?? 0,
      context: json['context'] ?? {},
      progressMs: json['progress_ms'] ?? 0,
      motivTrack: json['item'] ?? {},
      currentlyPlayingType: json['currently_playing_type'] ?? '',
      actions: json['actions'] ?? {},
      isPlaying: json['is_playing'] ?? false,
    );
  }
  @override
  String toString() {
    return 'MotivPlayerState(\n'
        '  source: $source,\n'
        '  device: $device,\n'
        '  timestamp: $timestamp,\n'
        '  context: $context,\n'
        '  progressMs: $progressMs,\n'
        '  motivTrack: $motivTrack,\n'
        '  currentlyPlayingType: $currentlyPlayingType,\n'
        '  actions: $actions,\n'
        '  isPlaying: $isPlaying\n'
        ')';
  }
}
