import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'package:intl/intl.dart';
import 'package:job_application/model/user.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:job_application/ui/style/style.dart';
import 'package:provider/provider.dart';

class EducationFormPage extends StatefulWidget {
  final Education?
      educationData; // Pass education data if editing, otherwise null for new entry

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
      print("education id : ${widget.educationData!.id}");
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
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
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
    final userP = Provider.of<UserProvider>(context, listen: true);
    ScreenUtil.init(
      context,
      designSize: Size(430, 932),
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            style: IconButton.styleFrom(
                padding: EdgeInsets.all(10.h),
                backgroundColor: Colors.transparent,
                side: BorderSide(width: 0.01, color: Colors.transparent)),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Iconsax.arrow_left,
              color: Colors.white,
            )),
        backgroundColor: primaryColor,
        title: Text(
          widget.educationData != null ? "Edit Education" : "Add Education",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 25.h,
              color: Colors.white70),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.w),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _FormBox('School', 'University, HighSchool',
                  'Please enter school name', schoolController),

              SizedBox(height: 16.h),

              _FormBox("Field of Study", 'Bachelor degree,PHD',
                  'Please enter a field of study', fieldController),

              SizedBox(height: 16.h),

              // Start Date

              Container(
                height: 92.h,
                //color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start Date",
                      style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.h),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(width: 0.5, color: primaryColor),
                          borderRadius: BorderRadius.circular(5.r)),
                      height: 55.h,
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: startDateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'DD/MM/YYYY',
                          hintStyle: GoogleFonts.poppins(
                              color: secondAccentColors, fontSize: 17.h),
                          suffixIcon: Icon(
                            Iconsax.calendar_2,
                            size: 30.h,
                            color: primaryColor,
                          ),
                        ),
                        onTap: () => _selectDate(context, startDateController),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select an start date';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              // End Date

              Container(
                height: 92.h,
                //color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "End Date",
                      style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.h),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(width: 0.5, color: primaryColor),
                          borderRadius: BorderRadius.circular(5.r)),
                      height: 55.h,
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: endDateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'DD/MM/YYYY',
                          hintStyle: GoogleFonts.poppins(
                              color: secondAccentColors, fontSize: 17.h),
                          suffixIcon: Icon(
                            Iconsax.calendar_2,
                            size: 30.h,
                            color: primaryColor,
                          ),
                        ),
                        onTap: () => _selectDate(context, endDateController),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select an end date';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Description
              _FormBox('Description', 'About your education',
                  'Please enter description', descriptionController),

              SizedBox(height: 16.h),

              // Submit Button
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: backgroundColor,
                      side: BorderSide(width: 2, color: primaryColor)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Education education = Education(
                          school: schoolController.text,
                          field: fieldController.text,
                          startDate: DateTime.parse(startDateController.text),
                          endDate: DateTime.parse(endDateController.text),
                          description: descriptionController.text);

                      // If editing, update the existing education
                      if (widget.educationData != null) {
                        userP.userEditEducation(userP.user.id!,
                            widget.educationData!.id!, education);

                        Get.back();
                        Get.snackbar(
                            'Success', 'Education updated successfully');
                      } else {
                        userP.userPostEducation(userP.user.id!, education);
                        Get.back();
                        Get.snackbar(
                            'Success', 'Education posted successfully');
                      }
//Get.back();
                      //Navigator.pop(context, newEducation);
                    }
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 60.h,
                      // decoration: BoxDecoration(color: Colors.amber),
                      child: Text(
                        widget.educationData != null
                            ? "Update Education"
                            : "+ Add Education",
                        style: GoogleFonts.poppins(
                            color: primaryColor,
                            fontSize: 18.h,
                            fontWeight: FontWeight.w500),
                      ))),

              // widget.educationData != null
              //     ? ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //             backgroundColor: Colors.redAccent),
              //         onPressed: () async {
              //           await userP.userDeleteEducation(
              //               userP.user.id!, widget.educationData!.id!);
              //           Get.back();
              //           Get.snackbar('Success', 'Education Deleted');
              //         },
              //         child: Text("Delete"))
              //     : ElevatedButton(onPressed: () {}, child: Text(""))
            ],
          ),
        ),
      ),
    );
  } // end

  _FormBox(String label, String hint, String error,
          TextEditingController controller) =>
      Container(
        height: 92.h,
        //color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.h),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(width: 0.5, color: primaryColor),
                  borderRadius: BorderRadius.circular(5.r)),
              height: 55.h,
              alignment: Alignment.center,
              child: TextFormField(
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.h),
                controller: controller,
                decoration: InputDecoration(
                    // fillColor: Colors.amber,
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: GoogleFonts.poppins(
                        color: secondAccentColors, fontSize: 17.h)),
                //hintText: "E"

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return error;
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      );
}
