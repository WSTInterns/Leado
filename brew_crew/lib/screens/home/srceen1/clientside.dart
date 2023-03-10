
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'hot_lead.dart';
import 'package:flutter/src/material/dropdown.dart';



// class MyAppShrey extends StatelessWidget {
//    const MyAppShrey({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
       
//         primarySwatch: Colors.blue,
//       ),
//       home:  HomePage(title: 'Client Details',email:'email',salesnamefinal: 'name',phone: 7620,),
//     );
//   }
// }

class HomePage extends StatefulWidget {

//  String  name, email,phone;
 // const HomePage({Key? key, required this.title});
 ///Homepage({required this.name,required this.email,required this.phone});
const HomePage({Key? key, required this.title,required this.email,required this.salesnamefinal,required this.phone}) : super(key: key);

 

  final String title;
  final String salesnamefinal ; 
  final int phone;
  final String email;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _selectedProduct ='';
  final List<String> _products = ['Product A', 'Product B', 'Product C'];
  Map<String, dynamic> formDetails = {};
  
  convertclients(){
    // DocumentReference documentReference = FirebaseFirestore.instance.collection('collectionPath').doc(formDetails["email"]);
    // documentReference.set(formDetails).whenComplete(()=>{print("created")});
  }

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
            title: Text(widget.title,
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
                   

       
                    
             body: SingleChildScrollView(
               child: Padding(
                         padding: EdgeInsets.all(15),
                         child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 20),
                    child: Text(
                      "NAME",
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      
                      textAlign: TextAlign.left,
                    ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 4, color: Color(0xffD9ACF5)),
                        ),
                        hintText: widget.salesnamefinal,
                      ),
                      onChanged: (value) => formDetails['name'] = value.trim(),
                    ),
                  ),
             
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
                        hintText: 'Enter a phone no',
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
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 4, color: Color(0xffD9ACF5)),
                        ),
                        hintText: widget.email,
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
                      "PRODUCT CATEGORY",
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
                        hintText: 'Enter the product category',
                      ),
                      onChanged: (value) => formDetails['category'] = value.trim(),
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
                      convertclients();
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
                         )),
             ));
  }
}
