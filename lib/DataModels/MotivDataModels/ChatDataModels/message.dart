import 'package:motiv_prototype/DataModels/MotivDataModels/ChatDataModels/message_data.dart';

class Message {
  final String itemID;
  final MessageData data;

  Message({required this.itemID, required this.data});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      itemID: json['itemID'],
      data: MessageData.fromJson(json['data']),
    );
  }
}
