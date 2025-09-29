import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final Map<String, String> profileData; // Pass existing data

  const EditProfilePage({super.key, required this.profileData});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController landmarkController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing data
    nameController = TextEditingController(text: widget.profileData['name']);
    landmarkController =
        TextEditingController(text: widget.profileData['landmark']);
    addressController =
        TextEditingController(text: widget.profileData['address']);
  }

  @override
  void dispose() {
    nameController.dispose();
    landmarkController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void saveProfile() {
    final updatedData = {
      'name': nameController.text,
      'landmark': landmarkController.text,
      'address': addressController.text,
    };
    Navigator.pop(context, updatedData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // ✅ allows body to resize when keyboard opens
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1E2A32),
      ),
      backgroundColor: const Color(0xFF151F24),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white30)),
                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: landmarkController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Landmark',
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white30)),
                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: addressController,
                maxLines: 1,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white30)),
                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 7),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
