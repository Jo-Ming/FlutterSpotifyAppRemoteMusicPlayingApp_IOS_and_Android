class Vote {
  late String queueId;
  late int vote;

  Vote({
    required this.queueId,
    required this.vote,
  });

  Vote.fromJson(Map<String, dynamic> json) {
    queueId = json['queueID'];
    vote = json['vote'];
  }
}
