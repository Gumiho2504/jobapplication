import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_application/model/job.dart';

class JobService {
  static const String baseUrl = 'http://localhost:8080/api/jobs';

  Future<List<Job>> fetchJobs() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Job> jobs = body.map((dynamic item) => Job.fromJson(item)).toList();
      return jobs;
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  Future<Job> fetchJobById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return Job.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load job');
    }
  }

  Future<Job> createJob(Job job) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(job.toJson()),
    );
    print(" res ${response.statusCode}");
    if (response.statusCode == 200) {
      print(" res ${response.statusCode}");
      return Job.fromJson(jsonDecode(response.body));
    } else {
      print(" res ${response.statusCode}");
      throw Exception('Failed to create job');
    }
  }

  Future<Job> updateJob(int id, Job job) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(job.toJson()),
    );
    if (response.statusCode == 200) {
      return Job.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update job');
    }
  }

  Future<void> deleteJob(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete job');
    }
  }
}