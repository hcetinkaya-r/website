class Work {
  Work({
    required this.id,
    required this.workTypeId,
    required this.title,
    required this.image,
  });

  int? id;
  int? workTypeId;
  String? title;
  String? image;

  factory Work.fromJson(Map<String, dynamic> json) => Work(
        id: json["id"],
        workTypeId: json["workTypeId"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "workTypeId": workTypeId,
        "title": title,
        "image": image,
      };
}
