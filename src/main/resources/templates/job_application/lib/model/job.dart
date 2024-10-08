// class Job {
//   final int id;
//   final String title;
//   // final String description;
//   // final String location;
//   // final String company;
//   // final String type;

//   Job(
//       {required this.id,
//       required this.title,
//       // required this.description,
//       // required this.location,
//       // required this.company,
//       // required this.type
//       });

//   factory Job.fromJson(Map<String, dynamic> json) {
//     return Job(
//       id: json['id'],
//       title: json['title'],
//       // description: json['description'],
//       // location: json['location'],
//       // company: json['company'],
//       // type: json['type'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       // 'description': description,
//       // 'location': location,
//       // 'company': company,
//       // 'type': type,
//     };
//   }
// }

// To parse this JSON data, do
//
//     final job = jobFromJson(jsonString);

import 'dart:convert';

List<Job> jobFromJson(String str) =>
    List<Job>.from(json.decode(str).map((x) => Job.fromJson(x)));

String jobToJson(List<Job> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Job {
  int id;
  String title;
  String description;
  String salary;
  String workModel;
  String type;
  String level;
  Company company;
  List<Requestment> requestments;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.salary,
    required this.workModel,
    required this.type,
    required this.level,
    required this.company,
    required this.requestments,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        salary: json["salary"],
        workModel: json["workModel"],
        type: json["type"],
        level: json["level"],
        company: Company.fromJson(json["company"]),
        requestments: List<Requestment>.from(
            json["requestments"].map((x) => Requestment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "salary": salary,
        "workModel": workModel,
        "type": type,
        "level": level,
        "company": company.toJson(),
        "requestments": List<dynamic>.from(requestments.map((x) => x.toJson())),
      };
}

class Company {
  int id;
  String name;
  String description;
  String phoneNumber;
  String email;
  List<Information> informations;

  Company({
    required this.id,
    required this.name,
    required this.description,
    required this.phoneNumber,
    required this.email,
    required this.informations,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        informations: List<Information>.from(
            json["informations"].map((x) => Information.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "phoneNumber": phoneNumber,
        "email": email,
        "informations": List<dynamic>.from(informations.map((x) => x.toJson())),
      };
}

class Information {
  String information;

  Information({
    required this.information,
  });

  factory Information.fromJson(Map<String, dynamic> json) => Information(
        information: json["information"],
      );

  Map<String, dynamic> toJson() => {
        "information": information,
      };
}

class Requestment {
  String requestment;

  Requestment({
    required this.requestment,
  });

  factory Requestment.fromJson(Map<String, dynamic> json) => Requestment(
        requestment: json["requestment"],
      );

  Map<String, dynamic> toJson() => {
        "requestment": requestment,
      };
}

final jobType = ["All", "Accountant", "DBM", "Contant Writting"];
