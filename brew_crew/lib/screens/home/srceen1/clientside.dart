
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'hot_lead.dart';
import 'package:flutter/src/material/dropdown.dart';



class MyAppShrey extends StatelessWidget {
   const MyAppShrey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title:'Client Details'),
    );
  }
}

class HomePage extends StatefulWidget {

//  String  name, email,phone;
 // const HomePage({Key? key, required this.title});
 ///Homepage({required this.name,required this.email,required this.phone});
const HomePage({Key? key, required this.title}) : super(key: key);

 

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _selectedProduct ='';
  final List<String> _products = ['Product A', 'Product B', 'Product C'];
  Map<String, dynamic> formDetails = {};
 @override
  
  void initState() {
  super.initState();
  _selectedProduct = '_products[0]';
}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: Text('Client Details',
                style: TextStyle(
                    color: Color(0xffffffff), fontWeight: FontWeight.bold)),
            elevation: 0,
            backgroundColor: Color(0xFF7F41B6),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.black,
                tooltip: 'Go back',
                onPressed: () {
                   Get.to(()=> HotLeads());
                }),
                
                ),
                   

       
                    
             body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 20),
                  child: Text(
                    "PHONE NUMBER",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 4, color: Color(0xffD9ACF5)),
                      ),
                      hintText: 'Enter a search term',
                    ),
                    onChanged: (value) => formDetails['phoneNumber'] = value.trim(),
                  ),
                ),
                   Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 20),
                  child: Text(
                    "EMAIL",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 4, color: Color(0xffD9ACF5)),
                      ),
                      hintText: 'Enter the email',
                    ),
                    onChanged: (value) => formDetails['email'] = value.trim(),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 20),
                  child: Text(
                    "PRODUCT",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    
                    textAlign: TextAlign.left,
                  ),
                ),        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 4, color: Color(0xffD9ACF5)),
                ),
                hintText: 'Select a product',
              ),
              items: <String>['Product A', 'Product B', 'Product C', 'Product D']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {

               formDetails['product'] = newValue?.trim();

              },
            ),
          ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 20),
                  child: Text(
                    "PRODUCT QUANTITY",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.black),
                      // ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 4, color: Color(0xffD9ACF5)),
                      ),
                      // errorBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //       width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      // ),
                      // border: OutlineInputBorder(),
                      hintText: 'Enter the Quantity of Product',

                      // hintText: 'Ent',
                    ),
                    onChanged: (value) => formDetails['quantity'] = value.trim(),

                  ),
                ),
              
                InkWell(
                  onTap: () {
                    print('FormDetails: $formDetails');
                   //Get.to(()=> MyAppShrey());
                   // FirebaseFirestore.collection('collectionName').doc('documentName').set(formDetails);
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xffA85CF9),
                    ),
                    child: const Center(
                        child: Text(
                      "SAVE & NEXT",
                      style: TextStyle(
                        color: Color(0xffECF2FF),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ],
            )));
  }
}
