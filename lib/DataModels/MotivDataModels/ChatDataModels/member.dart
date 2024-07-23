class Member {
  final String userID;

  Member({required this.userID});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      userID: json['userID'],
    );
  }
}
