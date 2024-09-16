import 'package:flutter/material.dart';
import 'package:job_application/ui/page/signin-page.dart';

class ProfileForm extends StatefulWidget {
  final Function(String, String) onSubmit;

  const ProfileForm({super.key, required this.onSubmit});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your title';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSubmit(_titleController.text, _phoneController.text);
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
