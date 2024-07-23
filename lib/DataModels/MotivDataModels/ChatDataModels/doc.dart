class Doc {
  final String name;
  final int type;

  Doc({required this.name, required this.type});

  factory Doc.fromJson(Map<String, dynamic> json) {
    return Doc(
      name: json['name'],
      type: json['type'],
    );
  }
}
