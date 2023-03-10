import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  File? pdffile;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 216, 212, 212),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
              Text(
                "Upload File",
                style: TextStyle(color: Colors.black, fontSize: 15),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              height: 70,
              // width: 200,
              color: Colors.white,
              child: Row(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Upload a File',
                          style: TextStyle(fontSize: 15),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 95),
                    child: TextButton(
                      onPressed: () async {
                        {
                          final result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf', 'doc']);
                          if (result != null) {
                            final path = result.files.single.path;
                            setState(() {
                              pdffile = File(path!);
                            });
                          }
                        }
                      },
                      child: Text(
                        'Upload',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'File Title',
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              maxLines: null,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                // border: OutlineInputBorder(),
                hintText: 'e.g.Ask for coffee in next 3 days',
              ),
            ),
            SizedBox(
              height: 300,
            ),
            Center(
              child: SizedBox(
                  height: 45,
                  width: 270,
                  child: ElevatedButton(
                      onPressed: null,
                      child: Text('Save File',
                          style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffA85CF9))))),
            )
          ],
        ),
      ),
    );
  }
}
