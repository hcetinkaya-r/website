class TopBarContent {
  TopBarContent({
    required this.id,
    required this.name,
    required this.quickContents,
  });

  int? id;
  String? name;
  List<String>? quickContents;

  factory TopBarContent.fromJson(Map<String, dynamic> json) => TopBarContent(
        id: json["id"],
        name: json["name"],
        quickContents: json["quickContents"] == null
            ? null
            : List<String>.from(json["quickContents"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "quickContents": quickContents == null
            ? null
            : List<dynamic>.from(quickContents!.map((x) => x)),
      };
}
