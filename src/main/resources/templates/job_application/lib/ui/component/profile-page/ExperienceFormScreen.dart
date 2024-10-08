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

class ExperienceFormScreen extends StatefulWidget {
  final Experience? experienceData;
  const ExperienceFormScreen({Key? key, this.experienceData}) : super(key: key);

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
    if (widget.experienceData != null) {
      _titleController.text = widget.experienceData!.title;
      _descriptionController.text = widget.experienceData!.description;
      _companyController.text = widget.experienceData!.company;
      _startDateController.text = widget.experienceData!.startDate.toString();
      _endDateController.text = widget.experienceData!.endDate.toString();
      _isWorking = widget.experienceData!.isWorking;
    }
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
          widget.experienceData != null ? "Edit Experience" : "Add Experience",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 25.h,
              color: Colors.white70),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _FormBox('Title', 'Experience ,IT , Management ..',
                  'Please enter the title', _titleController),
              SizedBox(height: 16),
              _FormBox('Description', 'About your experience ..',
                  'Please enter the description', _descriptionController),
              SizedBox(height: 16),
              _FormBox('Company', 'Company name  ..',
                  'Please enter the company name', _companyController),
              SizedBox(height: 16),
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
                        controller: _startDateController,
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
                        onTap: () => _selectDate(context, _startDateController),
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
              SizedBox(height: 16),
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
                        controller: _endDateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabled: !_isWorking,
                          hintText: 'DD/MM/YYYY',
                          hintStyle: GoogleFonts.poppins(
                              color: secondAccentColors, fontSize: 17.h),
                          suffixIcon: Icon(
                            Iconsax.calendar_2,
                            size: 30.h,
                            color: primaryColor,
                          ),
                        ),
                        onTap: () => _selectDate(context, _endDateController),
                        validator: (value) {
                          if (!_isWorking && (value == null || value.isEmpty)) {
                            return 'Please select an end date';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              CheckboxListTile(
                side: BorderSide(width: 01, color: primaryColor),
                title: Text(
                  'Currently Working Here',
                  style: GoogleFonts.poppins(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.h),
                ),
                value: _isWorking,
                activeColor: primaryColor,
                onChanged: (newValue) {
                  setState(() {
                    _isWorking = newValue ?? false;
                    if (_isWorking) {
                      _endDateController.text =
                          DateFormat("yyyy-MM-dd").format(DateTime.now());
                    }
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: backgroundColor,
                      side: BorderSide(width: 2, color: primaryColor)),
                  onPressed: () {
                    final userP =
                        Provider.of<UserProvider>(context, listen: false);
                    if (_formKey.currentState!.validate()) {
                      // Simulate saving the data (you could send a POST or PUT request here)
                      Experience experience = Experience(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          company: _companyController.text,
                          startDate: DateTime.parse(_startDateController.text),
                          endDate: DateTime.parse(
                            _isWorking ? "Present" : _endDateController.text,
                          ),
                          isWorking: _isWorking);
                      if (widget.experienceData != null) {
                        userP.userUpdateExperience(userP.user.id!,
                            widget.experienceData!.id!, experience);
                        Get.back();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Experience updated!')),
                        );
                      } else {
                        userP.userPostExperience(userP.user.id!, experience);

                        print("Experience data: $experience");

                        Get.back();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Experience saved!')),
                        );
                      }
                    }
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 60.h,
                      // decoration: BoxDecoration(color: Colors.amber),
                      child: Text(
                        widget.experienceData != null
                            ? 'Update Experience'
                            : '+ Add Experience',
                        style: GoogleFonts.poppins(
                            color: primaryColor,
                            fontSize: 18.h,
                            fontWeight: FontWeight.w500),
                      ))),
            ],
          ),
        ),
      ),
    );
  } //end

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
