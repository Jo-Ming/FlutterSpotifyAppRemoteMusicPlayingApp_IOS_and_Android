import 'dart:convert';
import 'package:motiv_prototype/DataModels/DataTransferObjects/slot_data.dart';

class MotivSlot {
  final String result;
  final String slotId;
  final SlotData data;

  MotivSlot({required this.result, required this.slotId, required this.data});

  factory MotivSlot.fromJson(Map<String, dynamic> json) {
    return MotivSlot(
      result: json['result'],
      slotId: json['slotid'],
      data: SlotData.fromJson(jsonDecode(json['data'])),
    );
  }
}
