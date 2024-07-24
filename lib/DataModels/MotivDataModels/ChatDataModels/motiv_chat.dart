import 'dart:convert';

import 'package:motiv_prototype/DataModels/MotivDataModels/ChatDataModels/doc.dart';
import 'package:motiv_prototype/DataModels/MotivDataModels/ChatDataModels/member.dart';
import 'package:motiv_prototype/DataModels/MotivDataModels/ChatDataModels/message.dart';

class MotivChat {
  final String result;
  final String chatid;
  final Doc doc;
  final List<Member> members;
  final List<Message> messages;
  final String extra;

  MotivChat(
      {required this.result,
      required this.chatid,
      required this.doc,
      required this.members,
      required this.messages,
      required this.extra});

  factory MotivChat.fromJson(Map<String, dynamic> json) {
    return MotivChat(
      result: json['result'],
      chatid: json['chatid'],
      doc: Doc.fromJson(jsonDecode(json['doc'])),
      members: List<Member>.from(
          jsonDecode(json['members']).map((x) => Member.fromJson(x))),
      messages: List<Message>.from(
          jsonDecode(json['messages']).map((x) => Message.fromJson(x))),
      extra: json['extra'],
    );
  }
}
