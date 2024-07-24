class QueueItemFirestoreAddedData {
  late String itemId;
  late String trackId;
  late dynamic timeAdded;

  QueueItemFirestoreAddedData(
      {required this.itemId, required this.trackId, required this.timeAdded});
}
