// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:job_application/model/job.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String password;
  List<Job> saveJobs;
  UserDetail userDetail;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.saveJobs,
    required this.userDetail,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
    saveJobs: List<Job>.from(json["saveJobs"].map((x) => Job.fromJson(x))),
    userDetail: UserDetail.fromJson(json["userDetail"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "saveJobs": List<dynamic>.from(saveJobs.map((x) => x.toJson())),
    "userDetail": userDetail.toJson(),
  };
}





class UserDetail {
  int id;
  String description;
  List<Education> educations;
  List<Skill> skills;
  List<Experience> experiences;

  UserDetail({
    required this.id,
    required this.description,
    required this.educations,
    required this.skills,
    required this.experiences,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
    id: json["id"],
    description: json["description"],
    educations: List<Education>.from(json["educations"].map((x) => Education.fromJson(x))),
    skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
    experiences: List<Experience>.from(json["experiences"].map((x) => Experience.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "educations": List<dynamic>.from(educations.map((x) => x.toJson())),
    "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
    "experiences": List<dynamic>.from(experiences.map((x) => x.toJson())),
  };
}

class Education {
  int id;
  String school;
  String field;
  String startDate;
  String endDate;
  String description;

  Education({
    required this.id,
    required this.school,
    required this.field,
    required this.startDate,
    required this.endDate,
    required this.description,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    id: json["id"],
    school: json["school"],
    field: json["field"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "school": school,
    "field": field,
    "startDate": startDate,
    "endDate": endDate,
    "description": description,
  };
}

class Experience {
  int id;
  String title;
  String description;
  String company;
  String startDate;
  String endDate;
  bool isWorking;

  Experience({
    required this.id,
    required this.title,
    required this.description,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.isWorking,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    company: json["company"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    isWorking: json["isWorking"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "company": company,
    "startDate": startDate,
    "endDate": endDate,
    "isWorking": isWorking,
  };
}

class Skill {
  int id;
  String name;

  Skill({
    required this.id,
    required this.name,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
