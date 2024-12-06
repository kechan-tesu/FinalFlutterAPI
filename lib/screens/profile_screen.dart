import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Controllers for text input fields
  TextEditingController _nameController =
      TextEditingController(text: 'User Name');
  TextEditingController _bioController =
      TextEditingController(text: 'This is the profile page.');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.blueAccent, // App bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Circle Avatar (Profile Picture)
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/app_icon.png'),
            ),
            SizedBox(height: 20),

            // Name input field with editing capability
            TextField(
              controller: _nameController,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: 'User Name',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
            ),
            SizedBox(height: 20),

            // Bio input field with editing capability
            TextField(
              controller: _bioController,
              style: TextStyle(fontSize: 16),
              maxLines: 4, // Allow multiple lines for bio
              decoration: InputDecoration(
                labelText: 'Bio',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
            ),
            SizedBox(height: 20),

            // Save Button to "Save" the profile changes
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Normally you'd save changes here, but for now, we simply update the state
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile Updated!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Save Profile',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),

            // Back Button to navigate to Home
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Back to Home',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
