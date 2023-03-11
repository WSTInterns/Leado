import 'dart:html';
import 'dart:js_util';

import 'package:brew_crew/screens/home/screen2/someday.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  CollectionReference docref = FirebaseFirestore.instance.collection("Leads");
  var allData;
  // myfun()async
  // {
  //   QuerySnapshot querySnapshot = await docref.get();
  //   final allData =  querySnapshot.docs.map((e) => e.data()).toList();
    
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Column(
        children: [
          ElevatedButton(onPressed:()async
  {
    QuerySnapshot querySnapshot = await docref.get();
     final allData =  querySnapshot.docs.map((e) => e.data()).toList();
    
  },
   child: Text("")),
          Center(child: Text('$allData')),
        ],
      ),
      
    );
  }
}
