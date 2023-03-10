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
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xffefefef),
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
          body: SingleChildScrollView(
            child: Column(
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
                        padding: EdgeInsets.only(left: 150),
                        child: TextButton(
                          onPressed: () async {
                            {
                              final result = await FilePicker.platform
                                  .pickFiles(
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("File Title"),
                  ),
                ),
                SizedBox(height: 20),
                // TextField(
                //   maxLines: null,
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: Colors.white,
                //     // border: OutlineInputBorder(),
                //     hintText: 'e.g.Ask for coffee in next 3 days',
                //   ),
                // ),
                Form(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: TextFormField(
                      // controller: titleController,
                      maxLines: null,
                      // validator: (value) {
                      //   // if (value == null || value.isEmpty) {
                      //   //   return 'Please enter some text';
                      //   // }
                      //   // return null;
                      //   if (value!.isEmpty) {
                      //     return "Required";
                      //   } else {
                      //     return null;
                      //   }
                      //   ;
                      //   onSaved:
                      //   (value) => form1Value = value;
                      // },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Sales Document...',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                ),
                Center(
                  child: SizedBox(
                      height: 50,
                      width: 390,
                      child: ElevatedButton.icon(
                          onPressed: null,
                          label: Text('Save File',
                              style: TextStyle(color: Colors.white)),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffA85CF9))),
                          icon: Icon(Icons.save_rounded))),
                )
              ],
            ),
          )),
    );
  }
}
