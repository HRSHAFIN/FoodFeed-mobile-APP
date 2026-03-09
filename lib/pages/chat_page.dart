import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _messageController = TextEditingController();

  // List of active users with profile pictures
  final List<Map<String, dynamic>> _activeUsers = [
    {
      'name': 'SHAFIN',
      'profilePicture':
          'lib/images/shafin.jpg', // Replace with actual image path
    },
    {
      'name': 'JOTHA',
      'profilePicture':
          'lib/images/jotha.jpg', // Replace with actual image path
    },
    // Add more users as needed
  ];

  void _sendMessage() {
    setState(() {
      _messages.insert(0, {
        'text': _messageController.text,
        'sender': 'You',
        'timestamp': DateTime.now(),
        'read': false,
      });
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Active',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _activeUsers
                        .map(
                          (user) => Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 24.0,
                                  backgroundImage:
                                      AssetImage(user['profilePicture']),
                                ),
                                SizedBox(height: 4.0),
                                Text(user['name']),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              reverse: true, // Reverse the order of messages
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isMe = message['sender'] == 'You';
                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blue : Colors.grey[200],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!isMe) ...[
                          CircleAvatar(
                            radius: 16.0,
                            backgroundImage: AssetImage(
                                'lib/images/default_profile_pic.jpg'), // Add default profile picture
                          ),
                          SizedBox(width: 8.0),
                        ],
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message['text'],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: isMe ? Colors.white : Colors.black,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                message['timestamp'].toString(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: isMe ? Colors.white70 : Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildMessageComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value) {
                  setState(() {
                    // You can add real-time validation or other actions here
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  contentPadding: EdgeInsets.all(12.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.0),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: _messageController.text.isEmpty ? null : _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
