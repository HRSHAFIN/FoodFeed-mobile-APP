import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: fakeNotifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.notifications,
                    color: Color.fromARGB(255, 139, 6, 73),
                  ),
                ),
                title: Text(
                  fakeNotifications[index]['title']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(fakeNotifications[index]['subtitle']!),
                onTap: () {
                  // Handle notification tap
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(fakeNotifications[index]['title']!),
                        content: Text(fakeNotifications[index]['message']!),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// Fake notifications data
List<Map<String, String>> fakeNotifications = [
  {
    'title': 'New Message',
    'subtitle': 'Niloy sent you a message',
    'message': '1ta new place paisi',
  },
  {
    'title': 'ORDER!!!',
    'subtitle': 'Order will be placed at 2:00 PM',
    'message': 'Don\'t forget to recieve your Food at your given address.',
  },
  {
    'title': 'New Message',
    'subtitle': 'Atik sent you a message',
    'message': 'Kire amer khana koire?',
  },
];
