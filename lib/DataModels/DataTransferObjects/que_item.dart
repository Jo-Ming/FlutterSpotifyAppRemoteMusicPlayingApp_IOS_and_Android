import 'package:motiv_prototype/DataModels/DataTransferObjects/queue_item_data.dart';

class QueItem {
  late String itemId;
  late QueueItemData data;

  QueItem({
    required this.itemId,
    required this.data,
  });

  QueItem.fromJson(Map<String, dynamic> json) {
    itemId = json['itemID'];
    data = QueueItemData.fromJson(json['data']);
  }
}
