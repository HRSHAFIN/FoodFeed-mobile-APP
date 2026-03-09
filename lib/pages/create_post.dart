import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodfeed/pages/post_detail_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:foodfeed/models/post.dart'; // Import the Post model
import 'package:foodfeed/pages/post_detail_page.dart'; // Import the PostDetailPage

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Post'),
        backgroundColor: Color.fromARGB(255, 139, 6, 73), // Set app bar color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _titleController,
              style: TextStyle(color: Colors.black), // Set text color
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200], // Set text field color
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _contentController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              style: TextStyle(color: Colors.black), // Set text color
              decoration: InputDecoration(
                labelText: 'Write your post here',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200], // Set text field color
              ),
            ),
            SizedBox(height: 20),
            _image != null
                ? Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.file(_image!),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _image = null;
                          });
                        },
                        icon: Icon(Icons.close),
                        color: Colors.red,
                      ),
                    ],
                  )
                : ElevatedButton.icon(
                    onPressed: _getImage,
                    icon: Icon(Icons.add_photo_alternate),
                    label: Text('Add Image',
                        style:
                            TextStyle(color: Colors.white)), // Set text color
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      backgroundColor:
                          Color.fromARGB(255, 139, 6, 73), // Set button color
                    ),
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _submitPost(context); // Pass context to submit function
              },
              child: Text('Submit',
                  style: TextStyle(color: Colors.white)), // Set text color
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromARGB(255, 139, 6, 73), // Set button color
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitPost(BuildContext context) {
    String title = _titleController.text;
    String content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      // Create a new Post object
      Post newPost = Post(
        title: title,
        content: content,
        imagePath: _image?.path ?? '',
      );

      // Navigate to PostDetailPage with the new post data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PostDetailPage(post: newPost),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error',
              style: TextStyle(color: Colors.white)), // Set text color
          content: Text('Please enter title and content for the post.',
              style: TextStyle(color: Colors.white)), // Set text color
          backgroundColor:
              Color.fromARGB(255, 139, 6, 73), // Set dialog background color
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK',
                  style: TextStyle(color: Colors.white)), // Set text color
            ),
          ],
        ),
      );
    }
  }
}
