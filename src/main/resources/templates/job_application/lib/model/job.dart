class Job {
  final int id;
  final String title;
  final String description;
  final String location;
  final String company;
  final String type;

  Job({required this.id, required this.title, required this.description, required this.location, required this.company, required this.type});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      company: json['company'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'company': company,
      'type': type,
    };
  }
}
