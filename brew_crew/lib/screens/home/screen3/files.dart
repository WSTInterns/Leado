import 'package:flutter/material.dart';
import 'upload_file.dart';

class contentFilesScreen extends StatefulWidget {
  String? title, message;
  // const templates({super.key});

  contentFilesScreen({this.title, this.message});

  @override
  State<contentFilesScreen> createState() => _contentFilesScreenState();
}

class _contentFilesScreenState extends State<contentFilesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffA85CF9),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => UploadFile()));

            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (BuildContext context) => const UploadFile()));
          },
          // foregroundColor: Colors.black,
          child: Icon(
            Icons.upload_file,
            color: Colors.white,
          ),
        ),
      )
    ;
  }
}
