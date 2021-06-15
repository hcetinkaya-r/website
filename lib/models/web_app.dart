// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:website/models/topbar_content.dart';
import 'package:website/models/web_user.dart';
import 'package:website/models/work.dart';
import 'package:website/models/work_type.dart';

WebApp welcomeFromJson(String str) => WebApp.fromJson(json.decode(str));

String welcomeToJson(WebApp data) => json.encode(data.toJson());

class WebApp {
  WebApp({
    this.webUsers,
    this.works,
    this.workTypes,
    this.topBarContents,
  });

  List<WebUser>? webUsers;
  List<Work>? works;
  List<WorkType>? workTypes;
  List<TopBarContent>? topBarContents;

  factory WebApp.fromJson(Map<String, dynamic> json) => WebApp(
        webUsers: List<WebUser>.from(
            json["webUsers"].map((x) => WebUser.fromJson(x))),
        works: List<Work>.from(json["works"].map((x) => Work.fromJson(x))),
        workTypes: List<WorkType>.from(
            json["workTypes"].map((x) => WorkType.fromJson(x))),
        topBarContents: List<TopBarContent>.from(
            json["topBarContents"].map((x) => TopBarContent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "webUsers": List<dynamic>.from(webUsers!.map((x) => x.toJson())),
        "works": List<dynamic>.from(works!.map((x) => x.toJson())),
        "workTypes": List<dynamic>.from(workTypes!.map((x) => x.toJson())),
        "topBarContents":
            List<dynamic>.from(topBarContents!.map((x) => x.toJson())),
      };
}
