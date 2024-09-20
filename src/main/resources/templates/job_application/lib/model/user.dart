// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:job_application/model/job.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int? id;
  String name;
  String email;
  String password;
  Profile? profile;
  List<Job>? saveJobs;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.profile,  // Nullable profile
    this.saveJobs, // Nullable saveJobs list
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    // Handle null `profile` safely
    profile: json["profile"] != null ? Profile.fromJson(json["profile"]) : null,
    // Handle null `saveJobs` safely
    saveJobs: json["saveJobs"] != null
        ? List<Job>.from(json["saveJobs"].map((x) => Job.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    // Ensure `profile` is not null
    "profile": profile?.toJson(),
    // Ensure `saveJobs` is not null
    "saveJobs": saveJobs != null
        ? List<dynamic>.from(saveJobs!.map((x) => x.toJson()))
        : [],
  };
}



class Profile {
  int? id;
  String title;
  String phoneNumber;
  List<Skill>? skills;
  List<Education>? educations;
  List<Experience>? experiences;

  Profile({
    this.id,
    required this.title,
    required this.phoneNumber,
    this.skills,
    this.educations,
    this.experiences,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    title: json["title"],
    phoneNumber: json["phoneNumber"],
    skills: json["skills"] != null
        ? List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x)))
        : [],
    educations: json["educations"] != null
        ? List<Education>.from(json["educations"].map((x) => Education.fromJson(x)))
        : [],
    experiences: json["experiences"] != null
        ? List<Experience>.from(json["experiences"].map((x) => Experience.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "phoneNumber": phoneNumber,
    "skills": skills != null
        ? List<dynamic>.from(skills!.map((x) => x.toJson()))
        : [],
    "educations": educations != null
        ? List<dynamic>.from(educations!.map((x) => x.toJson()))
        : [],
    "experiences": experiences != null
        ? List<dynamic>.from(experiences!.map((x) => x.toJson()))
        : [],
  };
}

class Skill {
  int id;
  String title;
  Skill({required this.id, required this.title});

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}

class Education {
  int? id;
  String school;
  String field;
  DateTime startDate;
  DateTime endDate;
  String description;

  Education({
    this.id,
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
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "school": school,
    "field": field,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "description": description,
  };
}

class Experience {
  int id;
  String title;
  String description;
  String company;
  DateTime startDate;
  DateTime endDate;
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
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    isWorking: json["isWorking"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "company": company,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "isWorking": isWorking,
  };
}










