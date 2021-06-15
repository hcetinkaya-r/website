class WebUser {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;

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

  WebUser.fromJson(Map json) {
    id = json["id"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    phoneNumber = json["phoneNumber"];
    email = json["email"];
  }

  Map toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "email": email
    };
  }
}
