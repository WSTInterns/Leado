/*
import 'package:flutter/material.dart';

void main() {
  runApp(const manual());
}

class manual extends StatelessWidget {
  const manual({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const My(title: 'Quick Add and Send Message'),
    );
  }
}

class My extends StatefulWidget {
  const My({super.key, required this.title});

  final String title;

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {

  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Go back')));
            },
          ),
          
      ),
      body: const DividerExample(),
      
    
// This trailing comma makes auto-formatting nicer for build methods.
    )

    );
      }
}
class DividerExample extends StatelessWidget {
  const DividerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       
    );
  }
}
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/screens/home/homescreen.dart';
import 'package:brew_crew/screens/home/client.dart';
import 'package:brew_crew/screens/home/phone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class manual extends StatefulWidget {
  manual({super.key});

  @override
  State<manual> createState() => _manualState();
}

class _manualState extends State<manual> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String name = '',
      email = '',
      password = '',
      notes = '',
      activity_status = 'warm';

  int phoneNo = 0;

  getName(String value) => {this.name = value};

  getPhoneNo(String value) => {this.phoneNo = int.parse(value)};

  getEmail(String value) => {this.email = value};

  getNotes(String value) => {this.notes = value};

  createlead() async {
    DocumentReference doc =
        await FirebaseFirestore.instance.collection("Leads").doc(email);
    Map<String, dynamic> leadlist = {
      "name": name,
      "email": email,
      "phoneNo": phoneNo,
      "notes": notes,
      "activity_status": activity_status,
      "uid": uid
    };
    doc.set(leadlist).whenComplete(() => {print("created")});
  }

  final _formkey = GlobalKey<FormState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Add New Client',
              style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            tooltip: 'Back',
            onPressed: () {
              //  Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomeBar(
                        title: "",
                      )));
            },
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(
              top: 35.5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: 16, bottom: 0, right: 15, top: 0),
                  child: Text(
                    "CLIENT NAME",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: TextField(
                    onChanged: (value) => {getName(value)},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2.5, color: Color(0xffD9ACF5)),
                      ),
                      hintText: 'Enter a search term',
                      hintStyle: TextStyle(
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 16, bottom: 0, right: 15, top: 0),
                  child: Text(
                    "PHONE NUMBER",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: TextField(
                    onChanged: (value) {
                      getPhoneNo(value);
                    },
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
                      hintText: 'Enter the Phone Number',
                      hintStyle: TextStyle(
                        fontFamily: "Montserrat",
                      ),

                      // hintText: 'Ent',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 16, bottom: 0, right: 15, top: 0),
                  child: Text(
                    "EMAIL ADDRESS",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: TextField(
                    onChanged: (value) {
                      getEmail(value);
                    },
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
                        hintText: 'Enter the Email Address',
                        hintStyle: TextStyle(
                          fontFamily: "Montserrat",
                        )

                        // hintText: 'Ent',
                        ),
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 16, bottom: 0, right: 15, top: 0),
                  child: Text(
                    "NOTES",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      getNotes(value);
                    },
                    maxLength: 500,
                    expands: false,

                    // minLines: 1,

                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2.5, color: Color(0xffD9ACF5)),
                      ),
                      // hintText: "Enter A Message Here",
                      hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: InkWell(
                    onTap: () {
                      createlead();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeBar(
                                title: "",
                              )));
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xffA85CF9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: Text(
                        "SAVE",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Color(0xffECF2FF),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            )));
  }
}
