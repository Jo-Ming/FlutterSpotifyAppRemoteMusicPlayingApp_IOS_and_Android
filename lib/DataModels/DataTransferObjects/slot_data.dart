class SlotData {
  final bool reserved;
  final String uuid;

  SlotData({required this.reserved, required this.uuid});

  factory SlotData.fromJson(Map<String, dynamic> json) {
    return SlotData(
      reserved: json['reserved'],
      uuid: json['uuid'],
    );
  }
}
