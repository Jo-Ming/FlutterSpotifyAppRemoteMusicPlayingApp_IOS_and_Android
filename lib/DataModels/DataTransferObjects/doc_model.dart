class DocModel {
  late DateTime lastUsed;
  late String pin;
  late String createdBy;
  late String name;
  late String motivChat;
  late bool pinLocked;

  DocModel({
    required this.lastUsed,
    required this.pin,
    required this.createdBy,
    required this.name,
    required this.motivChat,
    required this.pinLocked,
  });

  DocModel.fromJson(Map<String, dynamic> json) {
    lastUsed = DateTime.fromMillisecondsSinceEpoch(
      (json['lastused']['_seconds'] as int) * 1000,
    );
    pin = json['pin'];
    createdBy = json['createdBy'];
    name = json['name'];
    motivChat = json['motivChat'];
    pinLocked = json['pinLocked'];
  }
}
