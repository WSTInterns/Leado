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
    return  Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
              Text(
                "Upload File",
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "FILE TITLE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.black),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2.5, color: Color(0xffD9ACF5)),
                    ),
                    // errorBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //       width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                    // ),
                    // border: OutlineInputBorder(),
                    hintText: 'Enter the File Title',

                    // hintText: 'Ent',
                  ),
                ),
              ),
              // TextField(
              //   maxLines: null,
              //   decoration: InputDecoration(
              //     filled: true,
              //     fillColor: Colors.white,
              //     // border: OutlineInputBorder(),
              //     hintText: 'e.g.Ask for coffee in next 3 days',
              //   ),
              // ),

              Container(
                // width: 200,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 25),
                  child: InkWell(
                    onTap: () async {
                      {
                        final result = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf', 'doc']);
                        if (result != null) {
                          final path = result.files.single.path;
                          setState(
                            () {
                              pdffile = File(path!);
                            },
                          );
                        }
                      }
                    },
                    child: Container(
                      // margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xffA85CF9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "UPLOAD FILE",
                          style: TextStyle(
                            color: Color(0xffECF2FF),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 360,
              ),

              // ElevatedButton.icon(
              //   onPressed: () {},
              //   label: Text('Save File', style: TextStyle(color: Colors.white)),
              //   style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.all(
              //       Color(0xffA85CF9),
              //     ),
              //   ),
              //   icon: Icon(Icons.save_rounded),
              // ),
              Container(
                // width: 200,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 25),
                  child: InkWell(
                    onTap: () async {},
                    child: Container(
                      // margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xffA85CF9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "SAVE FILE",
                          style: TextStyle(
                            color: Color(0xffECF2FF),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ;
  }
}
