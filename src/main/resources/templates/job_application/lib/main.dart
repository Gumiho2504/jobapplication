import 'package:flutter/material.dart';
import 'package:job_application/model/job.dart';
import 'package:job_application/provider/job_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JobProvider(),
      child: MaterialApp(
        title: 'Job Application',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: JobListScreen(),
      ),
    );
  }
}

class JobListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);

    return Scaffold(
     // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Job List'),
      ),
      body: jobProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: jobProvider.jobs.length,
              itemBuilder: (context, index) {
                final job = jobProvider.jobs[index];
                return ListTile(
                  title: Text(job.title,style: TextStyle(color: Colors.black),),
                  subtitle: Text(job.company),
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
        child: Icon(Icons.add),
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

class AddJobScreen extends StatefulWidget {
  @override
  _AddJobScreenState createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  String _location = '';
  String _company = '';
  String _type = '';

  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Job'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                onSaved: (value) {
                  _location = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Company'),
                onSaved: (value) {
                  _company = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Type'),
                onSaved: (value) {
                  _type = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    jobProvider.addJob(Job(
                      id: 0,
                      title: _title,
                      description: _description,
                      location: _location,
                      company: _company,
                      type: _type,
                    ));
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Job'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
