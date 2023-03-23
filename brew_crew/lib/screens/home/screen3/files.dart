import 'package:flutter/material.dart';
import 'upload_file.dart';

class Wid extends StatelessWidget {
  String? title, message;
  // const templates({super.key});

  Wid({this.title, this.message});

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
