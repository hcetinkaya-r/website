class WebUser {
  WebUser(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email});

  WebUser.withId(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email});

  WebUser.withoutInfo();

  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;

  factory WebUser.fromJson(Map<String, dynamic> json) => WebUser.withId(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
      };
}
