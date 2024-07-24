class MessageData {
  final String text;
  final String userID;
  String imageUrls;

  MessageData({required this.text, required this.userID, this.imageUrls = ""});

  factory MessageData.fromJson(Map<String, dynamic> json) {
    return MessageData(
        text: json['text'],
        userID: json['userID'],
        imageUrls: json['imageURL']);
  }
}
