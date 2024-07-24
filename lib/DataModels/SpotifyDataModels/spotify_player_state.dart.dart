class SpotifyPlayerState {
  final Map<String, dynamic> device;
  final bool shuffleState;
  final String repeatState;
  final int timestamp;
  final Map<String, dynamic> context;
  final int progressMs;
  final Map<String, dynamic> item;
  final String currentlyPlayingType;
  final Map<String, dynamic> actions;
  final bool isPlaying;

  SpotifyPlayerState({
    required this.device,
    required this.shuffleState,
    required this.repeatState,
    required this.timestamp,
    required this.context,
    required this.progressMs,
    required this.item,
    required this.currentlyPlayingType,
    required this.actions,
    required this.isPlaying,
  });

  factory SpotifyPlayerState.fromJson(Map<String, dynamic> json) {
    return SpotifyPlayerState(
      device: json['device'] ?? {},
      shuffleState: json['shuffle_state'] ?? false,
      repeatState: json['repeat_state'] ?? 'off',
      timestamp: json['timestamp'] ?? 0,
      context: json['context'] ?? {},
      progressMs: json['progress_ms'] ?? 0,
      item: json['item'] ?? {},
      currentlyPlayingType: json['currently_playing_type'] ?? '',
      actions: json['actions'] ?? {},
      isPlaying: json['is_playing'] ?? false,
    );
  }

  @override
  String toString() {
    return 'PlayerState(\n'
        'device: $device,\n'
        'shuffleState: $shuffleState,\n'
        'repeatState: $repeatState,\n'
        'timestamp: $timestamp,\n'
        'context: $context,\n'
        'progressMs: $progressMs,\n'
        'item: $item,\n'
        'currentlyPlayingType: $currentlyPlayingType,\n'
        'actions: $actions,\n'
        'isPlaying: $isPlaying\n'
        ')';
  }
}
