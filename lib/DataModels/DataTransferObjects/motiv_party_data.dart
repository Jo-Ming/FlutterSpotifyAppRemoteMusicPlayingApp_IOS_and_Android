import 'dart:convert';

import 'package:motiv_prototype/DataModels/DataTransferObjects/doc_model.dart';
import 'package:motiv_prototype/DataModels/DataTransferObjects/que_item.dart';
import 'package:motiv_prototype/DataModels/DataTransferObjects/vote.dart';

class MotivPartyData {
  late String result;
  late String motivId;
  late String userId;
  late DocModel doc;
  late List<QueItem> que;
  late List<Vote> vot;

  MotivPartyData({
    required this.result,
    required this.motivId,
    required this.userId,
    required this.doc,
    required this.que,
    required this.vot,
  });

  MotivPartyData.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    motivId = json['motivid'];
    userId = json['userid'];
    doc = DocModel.fromJson(jsonDecode(json['doc']));
    que = List<QueItem>.from(
        jsonDecode(json['queue']).map((item) => QueItem.fromJson(item)));
    vot = List<Vote>.from(
        jsonDecode(json['votes']).map((item) => Vote.fromJson(item)));
  }
}
