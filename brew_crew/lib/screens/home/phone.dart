import 'package:brew_crew/screens/home/srceen1/upload_excel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:brew_crew/screens/home/srceen1/pb.dart';
import 'package:brew_crew/screens/home/srceen1/addmanual.dart';

class Special extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new phonebook());
  }
}

class phonebook extends StatelessWidget {
  //const phonebook({super.key});
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  static const IconData remove_circle_outline =
      IconData(0xe518, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          openCloseDial: isDialOpen,
          backgroundColor: const Color(0xffA85CF9),
          overlayColor: Colors.grey,
          overlayOpacity: 0.5,
          spacing: 20,
          spaceBetweenChildren: 20,
          closeManually: true,
          children: [
            SpeedDialChild(
                child: Icon(
                  Icons.contact_phone_sharp,
                  color: Color.fromRGBO(168, 92, 249, 0.7),
                ),
                label: 'Import from PhoneBook',
                labelBackgroundColor: Colors.transparent,
                elevation: 0,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white),
                backgroundColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => MyApp()));
                }),
            SpeedDialChild(
                child: Icon(
                  Icons.contacts_rounded,
                  color: Color.fromRGBO(168, 92, 249, 0.7),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                label: 'Enter a new Contact',
                labelBackgroundColor: Colors.transparent,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => manual()));
                }),
            SpeedDialChild(
                child: Icon(
                  Icons.table_chart,
                  color: Color.fromRGBO(168, 92, 249, 0.7),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                label: 'Import Excel',
                labelBackgroundColor: Colors.transparent,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => UploadExcel()),
                  );
                }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 23, 15, 0),
          child: Container(
            alignment: Alignment.topCenter,
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("Leads").snapshots(),
              builder: ((context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: ((context, int index) {
                      DocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];
                      var clientName = documentSnapshot["name"];
                      return GestureDetector(
                        onTap: () {
                          print("I'm a disco dancer");
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 10,
                          ),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(0, 0, 0, 0)
                                    .withOpacity(0.04),
                                // color:
                                //     const Color.fromRGBO(50, 50, 93, 0.25).withOpacity(0.1),
                                spreadRadius: 10,
                                blurRadius: 20,
                                offset: const Offset(
                                    0, 8), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 27,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  clientName.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              // Expanded(
                              //   child:
                              //       Text(documentSnapshot["phoneNo"].toString()),
                              // ),
                              // Expanded(
                              //   child:
                              //       Text(documentSnapshot["email"]),
                              // ),
                              // Expanded(
                              //   child:
                              //       Text(documentSnapshot["notes"]),
                              // ),
                              // Expanded(
                              //   child:
                              //       Text(documentSnapshot["activity_status"]),
                              // ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                } else {
                  return Text('data not found');
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}
/*
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:radhe/pb/pb.dart';

class phonebook extends StatelessWidget {
  //const phonebook({super.key});
ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  static const IconData remove_circle_outline = IconData(0xe518, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
         return WillPopScope(
      onWillPop: () async{
          if(isDialOpen.value){
            isDialOpen.value = false;
            return false;
          }else{
            return true;
          }
      },
      child: Scaffold(
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          openCloseDial: isDialOpen,
          backgroundColor: Colors.redAccent,
          overlayColor: Colors.grey,
          overlayOpacity: 0.5,
          spacing: 20,
          spaceBetweenChildren: 20,
          closeManually: true,
          children: [
            SpeedDialChild(
              
              child: Icon(Icons.contact_phone_sharp),
              label: 'Import from PhoneBook',
              labelBackgroundColor: Colors.transparent,

              elevation: 0,
              labelStyle:
                    TextStyle(fontWeight: FontWeight.w500,fontSize: 20 ,color: Colors.white),
              backgroundColor: Colors.transparent,
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>pb()));
              }
            ),
            SpeedDialChild(
              child: Icon(Icons.contacts_rounded),
               backgroundColor: Colors.transparent,
               elevation: 0,
              label: 'Enter a new Contact',
              labelBackgroundColor: Colors.transparent,
              labelStyle:
                TextStyle(fontWeight: FontWeight.w500,fontSize: 20 ,color: Colors.white),
                onTap: (){
                  print('Mail Tapped');
                }
            ),
            SpeedDialChild(
              child: Icon(Icons.telegram),
               backgroundColor: Colors.transparent,
               elevation: 0,
              label: 'Quick Add & Send Message',
              labelBackgroundColor: Colors.transparent,
              labelStyle:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 20 ,color: Colors.white),
                onTap: (){
                  print('Copy Tapped');
                }
            ),
           SpeedDialChild(
              child: Icon(Icons.table_chart),
               backgroundColor: Colors.transparent,
               elevation: 0,
              label: 'Import Excel',
              labelBackgroundColor: Colors.transparent,
              labelStyle:
                    TextStyle(fontWeight: FontWeight.w500,fontSize: 20 ,color: Colors.white),
                onTap: (){
                  print('Copy Tapped');
                }
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: const Text("",style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }
}
*/