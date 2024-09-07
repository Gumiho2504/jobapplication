// import 'package:flutter/material.dart';
// import 'package:job_application/model/job.dart';
// import 'package:job_application/provider/job_provider.dart';
// import 'package:job_application/ui/page/jobdetial-page.dart';
// import 'package:provider/provider.dart';
//
// class EditJobPage extends StatefulWidget {
//   final Job jobData;
//
//   EditJobPage({required this.jobData});
//
//   @override
//   _EditJobPageState createState() => _EditJobPageState();
// }
//
// class _EditJobPageState extends State<EditJobPage> {
//   late TextEditingController _titleController;
//   late TextEditingController _descriptionController;
//   late TextEditingController _locationController;
//   late TextEditingController _companyController;
//   late TextEditingController _typeController;
//
//   @override
//   void initState() {
//     super.initState();
//     _titleController = TextEditingController(text: widget.jobData.title);
//     _descriptionController =
//         TextEditingController(text: widget.jobData.description);
//     _locationController = TextEditingController(text: widget.jobData.location);
//     _companyController = TextEditingController(text: widget.jobData.location);
//     _typeController = TextEditingController(text: widget.jobData.type);
//   }
//
//   @override
//   void dispose() {
//     _titleController.dispose();
//     _descriptionController.dispose();
//     _locationController.dispose();
//     _companyController.dispose();
//     _typeController.dispose();
//     super.dispose();
//   }
//
//   void _saveJob() {}
//
//   @override
//   Widget build(BuildContext context) {
//     final jobProvider = Provider.of<JobProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Job'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.save),
//             onPressed: () {
//               Job tempJob = Job(
//                   id: widget.jobData.id,
//                   title: _titleController.text,
//                   description: _descriptionController.text,
//                   location: _locationController.text,
//                   company: _companyController.text,
//                   type: _typeController.text);
//               jobProvider.updateJob(widget.jobData.id, tempJob);
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => JobDetailScreen(job: tempJob)));
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 controller: _titleController,
//                 decoration: InputDecoration(labelText: 'Job Title'),
//               ),
//               TextFormField(
//                 controller: _companyController,
//                 decoration: InputDecoration(labelText: 'Company'),
//               ),
//               TextFormField(
//                 controller: _locationController,
//                 decoration: InputDecoration(labelText: 'Location'),
//               ),
//               TextFormField(
//                 controller: _typeController,
//                 decoration: InputDecoration(labelText: 'Type'),
//               ),
//               TextFormField(
//                 controller: _descriptionController,
//                 maxLines: 5,
//                 decoration: InputDecoration(labelText: 'Description'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
