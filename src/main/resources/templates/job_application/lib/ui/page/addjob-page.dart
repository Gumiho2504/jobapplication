// import 'package:flutter/material.dart';
// import 'package:job_application/model/job.dart';
// import 'package:job_application/provider/job_provider.dart';
// import 'package:job_application/ui/page/joblist-page.dart';
// import 'package:provider/provider.dart';
//
// class AddJobScreen extends StatefulWidget {
//   @override
//   _AddJobScreenState createState() => _AddJobScreenState();
// }
//
// class _AddJobScreenState extends State<AddJobScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String _title = '';
//   String _description = '';
//   String _location = '';
//   String _company = '';
//   String _type = '';
//
//   @override
//   Widget build(BuildContext context) {
//     final jobProvider = Provider.of<JobProvider>(context, listen: false);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Job'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Title'),
//                 onSaved: (value) {
//                   _title = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Description'),
//                 onSaved: (value) {
//                   _description = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Location'),
//                 onSaved: (value) {
//                   _location = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Company'),
//                 onSaved: (value) {
//                   _company = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Type'),
//                 onSaved: (value) {
//                   _type = value!;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     jobProvider.addJob(Job(
//                       id: 0,
//                       title: _title,
//                       description: _description,
//                       location: _location,
//                       company: _company,
//                       type: _type,
//                     ));
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: Text('Add Job'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
