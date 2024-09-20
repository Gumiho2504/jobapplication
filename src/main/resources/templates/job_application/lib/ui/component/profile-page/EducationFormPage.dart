import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:job_application/model/user.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:provider/provider.dart';

class EducationFormPage extends StatefulWidget {
  final Education? educationData;// Pass education data if editing, otherwise null for new entry

  const EducationFormPage({Key? key, this.educationData}) : super(key: key);

  @override
  _EducationFormPageState createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController fieldController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // If editing, pre-populate the form with existing data
    if (widget.educationData != null) {
      schoolController.text = widget.educationData!.school;
      fieldController.text = widget.educationData!.field;
      startDateController.text = widget.educationData!.startDate.toString();
      endDateController.text = widget.educationData!.endDate.toString();
      descriptionController.text = widget.educationData!.description;
    }
  }

  @override
  void dispose() {
    schoolController.dispose();
    fieldController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  // Method to show DatePicker and format the selected date
  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        controller.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.educationData != null ? "Edit Education" : "Add Education"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // School Name
              TextFormField(
                controller: schoolController,
                decoration: InputDecoration(labelText: 'School'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a school name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // Field of Study
              TextFormField(
                controller: fieldController,
                decoration: InputDecoration(labelText: 'Field of Study'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a field of study';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // Start Date
              TextFormField(
                controller: startDateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => _selectDate(context, startDateController),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a start date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // End Date
              TextFormField(
                controller: endDateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'End Date',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => _selectDate(context, endDateController),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an end date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // Description
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  final userP = Provider.of<UserProvider>(context,listen: false);
                  if (_formKey.currentState!.validate()) {

                    Education education = Education(

                        school: schoolController.text,
                        field: fieldController.text,
                        startDate: DateTime.parse(startDateController.text),
                        endDate: DateTime.parse(endDateController.text),
                        description: descriptionController.text
                  );

                    // If editing, update the existing education
                    if (widget.educationData != null) {

                    } else {
                      userP.userPostEducation(userP.user.id!, education);
                        Get.back();
                    }

                    //Navigator.pop(context, newEducation);
                  }
                },
                child: Text(widget.educationData != null ? "Update Education" : "Add Education"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
