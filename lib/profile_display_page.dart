import 'package:flutter/material.dart';

class ProfileDisplayPage extends StatelessWidget {
  final String name;
  final String address;
  final String landmark;
  final String location; // street, city or lat/lon string
  final ImageProvider? profileImage; // optional: pass AssetImage/NetworkImage/FileImage

  const ProfileDisplayPage({
    super.key,
    required this.name,
    required this.address,
    required this.landmark,
    required this.location,
    this.profileImage,
  });

  Widget _infoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white70, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    )),
                const SizedBox(height: 4),
                Text(
                  value.isNotEmpty ? value : 'Not provided',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151F24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF151F24),
        leading: const BackButton(color: Colors.white),
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top card with avatar and name
            Card(
              color: const Color(0xFF202A30),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white12,
                      backgroundImage: profileImage,
                      child: profileImage == null
                          ? const Icon(Icons.person, color: Colors.white54, size: 36)
                          : null,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name.isNotEmpty ? name : 'No name provided',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            location.isNotEmpty ? location : 'Location not set',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Details card
            Expanded(
              child: Card(
                color: const Color(0xFF202A30),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Details',
                          style: TextStyle(color: Colors.white70, fontSize: 14)),
                      const SizedBox(height: 12),
                      _infoRow(Icons.location_on, 'Address', address),
                      const Divider(color: Colors.white24),
                      _infoRow(Icons.place, 'Landmark', landmark),
                      const Divider(color: Colors.white24),
                      _infoRow(Icons.map, 'Location', location),
                      const Spacer(),
                      // Optional Edit button or close
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.edit, color: Colors.white70),
                            label: const Text('Edit', style: TextStyle(color: Colors.white70)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
