class Work {
  int? id;
  int? workTypeId;
  String? title;
  String? image;

  Work(
      {required this.id,
      required this.workTypeId,
      required this.title,
      required this.image});

  Work.fromJson(Map json) {
    id = json["id"];
    workTypeId = json["workTypeId"];
    title = json["title"];
    image = json["image"];
  }

  Map toJson() {
    return {"id": id, "workTypeId": workTypeId, "title": title, "image": image};
  }
}
