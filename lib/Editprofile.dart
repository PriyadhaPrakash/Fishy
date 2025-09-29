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
    // Update the profile data (you can send it to backend or local storage)
    final updatedData = {
      'name': nameController.text,
      'landmark': landmarkController.text,
      'address': addressController.text,
    };

    // For now, just show a SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );

    Navigator.pop(context, updatedData); // Go back to profile page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Edit Profile',style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF1E2A32),
      ),
      backgroundColor: const Color(0xFF151F24),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Name field
            TextField(
              controller: nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
            const SizedBox(height: 12),

            // Landmark field
            TextField(
              controller: landmarkController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Landmark',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
            const SizedBox(height: 12),

            // Address field
            TextField(
              controller: addressController,
              maxLines: 3,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Address',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
            const SizedBox(height: 20),

            // Save button
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
    );
  }
}
