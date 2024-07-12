import 'package:flutter/material.dart';
import 'package:job_application/model/job.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;

  JobDetailScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${job.title}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Description: ${job.description}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Location: ${job.location}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Company: ${job.company}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Type: ${job.type}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}


