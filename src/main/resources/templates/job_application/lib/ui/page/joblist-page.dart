import 'package:flutter/material.dart';
import 'package:job_application/provider/job_provider.dart';
import 'package:job_application/ui/page/addjob-page.dart';
import 'package:job_application/ui/page/jobdetial-page.dart';
import 'package:provider/provider.dart';

class JobListScreen extends StatelessWidget {
  const JobListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);

    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Job List'),
      ),
      body: jobProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: jobProvider.jobs.length,
              itemBuilder: (context, index) {
                final job = jobProvider.jobs[index];
                return ListTile(
                  title: Text(
                    job.title,
                    style: const TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(job.company),
                  trailing: IconButton(
                    onPressed: () {
                      jobProvider.deleteJob(job.id);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobDetailScreen(job: job),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddJobScreen()),
          );
        },
      ),
    );
  }
}
