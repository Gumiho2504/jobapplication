

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_application/model/user.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ExperienceFormScreen extends StatefulWidget {
  final Experience? experienceData;
  const ExperienceFormScreen({Key? key,this.experienceData}) : super(key: key);


  @override
  _ExperienceFormScreenState createState() => _ExperienceFormScreenState();
}

class _ExperienceFormScreenState extends State<ExperienceFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // TextField Controllers
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  bool _isWorking = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.experienceData != null) {
      _titleController.text = widget.experienceData!.title;
      _descriptionController.text = widget.experienceData!.description;
      _companyController.text = widget.experienceData!.company;
      _startDateController.text = widget.experienceData!.startDate.toString();
      _endDateController.text = widget.experienceData!.endDate.toString();
      _isWorking = widget.experienceData!.isWorking;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add or Update Experience'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _companyController,
                decoration: InputDecoration(labelText: 'Company'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the company name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _startDateController,
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  hintText: 'YYYY-MM-DD',
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the start date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _endDateController,
                decoration: InputDecoration(
                  labelText: 'End Date',
                  hintText: 'YYYY-MM-DD',
                ),
                keyboardType: TextInputType.datetime,
                enabled: !_isWorking,
                validator: (value) {
                  if (!_isWorking && (value == null || value.isEmpty)) {
                    return 'Please enter the end date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CheckboxListTile(
                title: Text('Currently Working Here'),
                value: _isWorking,
                onChanged: (newValue) {
                  setState(() {
                    _isWorking = newValue ?? false;
                    if (_isWorking) {
                      _endDateController.clear();
                    }
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final userP = Provider.of<UserProvider>(context,listen: false);
                  if (_formKey.currentState!.validate()) {
                    // Simulate saving the data (you could send a POST or PUT request here)
                    Experience experience = Experience(

                        title: _titleController.text,
                        description: _descriptionController.text,
                        company: _companyController.text,
                        startDate: DateTime.parse(_startDateController.text),
                        endDate: DateTime.parse(_isWorking ? "Present" : _endDateController.text,),
                        isWorking: _isWorking);
if(widget.experienceData != null){
   userP.userUpdateExperience(userP.user.id!, widget.experienceData!.id!, experience);
   Get.back();
   ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(content: Text('Experience updated!')),
   );
}else {
  userP.userPostExperience(userP.user.id!, experience);

  print("Experience data: $experience");

  Get.back();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Experience saved!')),
  );
}
                  }
                },
                child: Text(widget.experienceData != null ? 'Update Experience':'Save Experience'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}