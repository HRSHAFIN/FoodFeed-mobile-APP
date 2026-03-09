import 'package:flutter/material.dart';
import 'account_settings_page.dart'; // Import the account settings page

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              'General Settings',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Account'),
              leading: Icon(Icons.account_circle),
              onTap: () {
                // Navigate to AccountSettingsPage when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountSettingsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Notifications'),
              leading: Icon(Icons.notifications),
              onTap: () {
                // Handle Notification Settings
              },
            ),
            ListTile(
              title: Text('Privacy'),
              leading: Icon(Icons.privacy_tip),
              onTap: () {
                // Handle Privacy Settings
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Appearance',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Theme'),
              leading: Icon(Icons.color_lens),
              onTap: () {
                // Handle Theme Settings
              },
            ),
            ListTile(
              title: Text('Font Size'),
              leading: Icon(Icons.text_fields),
              onTap: () {
                // Handle Font Size Settings
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'About',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Divider(),
            ListTile(
              title: Text('About Us'),
              leading: Icon(Icons.info),
              onTap: () {
                // Handle About Us
              },
            ),
            ListTile(
              title: Text('Terms & Conditions'),
              leading: Icon(Icons.description),
              onTap: () {
                // Handle Terms & Conditions
              },
            ),
          ],
        ),
      ),
    );
  }
}
