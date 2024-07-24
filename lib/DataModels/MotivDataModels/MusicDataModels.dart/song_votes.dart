class SongVotes {
  final List<String> upVotes;
  final List<String> downVotes;

  SongVotes({
    required this.upVotes,
    required this.downVotes,
  });

  factory SongVotes.fromJson(Map<String, dynamic> json) {
    return SongVotes(
      upVotes: List<String>.from(json['upVotes']),
      downVotes: List<String>.from(json['downVotes']),
    );
  }
}
