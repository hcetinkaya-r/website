class WorkType {
  WorkType({
    required this.id,
    required this.name,
  });

  int? id;
  String? name;

  factory WorkType.fromJson(Map<String, dynamic> json) => WorkType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
