class WorkType {
  int? id;
  String? name;

  WorkType({required this.id, required this.name});

  WorkType.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
  }

  Map toJson() {
    return {"id": id, "name": name};
  }
}
