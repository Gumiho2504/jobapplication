import 'package:flutter/material.dart';
import 'package:job_application/model/job.dart';
import 'package:job_application/service/job_service.dart';



class JobProvider with ChangeNotifier {

  JobService _jobService = JobService();
  

  List<Job> _jobs = [];
  bool _isLoading = false;

  List<Job> get jobs => _jobs;
  bool get isLoading => _isLoading;
    JobProvider() {
    fetchJobs();
  }


  Future<void> fetchJobs() async {
    _isLoading = true;
    notifyListeners();
    _jobs = await _jobService.fetchJobs();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addJob(Job job) async {
    await _jobService.createJob(job);
    await fetchJobs();
  }

  Future<void> updateJob(int id, Job job) async {
    await _jobService.updateJob(id, job);
    await fetchJobs();
  }

  Future<void> deleteJob(int id) async {
    await _jobService.deleteJob(id);
    await fetchJobs();
  }
}
