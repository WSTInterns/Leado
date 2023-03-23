import 'package:brew_crew/screens/home/homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'clientside.dart';

// import 'package:get/get.dart';
// import 'package:brew_crew/screens/home/srceen1/leadmain.dart';

class Person {
  final String name;
  final String email;
  final int phoneNo;
  bool isChecked;

  Person(
      {required this.name,
      required this.email,
      required this.phoneNo,
      this.isChecked = false});
}

//CCCCCCCCHHHHHHHHHHHHHAAAAAAAAAATTTTTTTGGGGGGPPPPPPPPPPTTTTTTTTTTcHATGPT
class ColdLeads extends StatefulWidget {
  @override
  State<ColdLeads> createState() => _ColdLeadsState();
}

class _ColdLeadsState extends State<ColdLeads> {
  String salesperson = '';
  String email = '';
  int phonenumber = 0;
  bool _showButton = false;
  final CollectionReference leadsCollection =
      FirebaseFirestore.instance.collection('Leads');
  
  


  converttohot() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Leads').doc(email);
        documentReference.update({"activity_status": "hot"})
  .then((value) => print("Field updated"))
  .catchError((error) => print("Failed to update field: $error"));
    // documentReference.set({"activity_status": 'cold'}).whenComplete(
    //     () => {print("created")});
  }

  converttowarm() {
    print('################################');
    print(email);
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Leads').doc(email);
        documentReference.update({"activity_status": "warm"})
  .then((value) => print("Field updated"))
  .catchError((error) => print("Failed to update field: $error"));
    // documentReference.set({"activity_status": 'cold'}).whenComplete(
    //     () => {print("created")});
  }
  void bottomsheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          // height: 670,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                dense: true,
                title: Text(
                  'Options',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                tileColor: Colors.grey[100],
              ),
              InkWell(
                onTap: () {
                  converttohot();
                },
                child: ListTile(
                  dense: true,
                  title: Row(
                    children: [
                     Icon(
                      Icons.whatshot,
                      color: Colors.red,
                    ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Convert to HOT LEAD'),
                    ],
                  ),
                ),
              ),
              Divider(thickness: 2, height: 5),
              InkWell(
                onTap: () {
                  converttowarm();
                },
                child: ListTile(
                  dense: true,
                  title: Row(
                    children: [
                      Icon(
                      Icons.whatshot,
                      color: Colors.grey,
                    ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Convert to WARM LEAD'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Cold Leads',style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          tooltip: 'Back',
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeBar(
                          title: 'Leads',
                        )));
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 26, 15, 10),
        child: StreamBuilder<QuerySnapshot>(
          stream: leadsCollection
              .where('activity_status', isEqualTo: 'cold')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

          final List<Person> people = snapshot.data!.docs.map((doc) {
            final String name = doc['name'];
            final String email = doc['email'];
            final int phoneNo = doc['phoneNo'];
            return Person(name: name, email: email, phoneNo: phoneNo);
          }).toList();
            
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: people.length,
                  itemBuilder: (context, index) {
                    final person = people[index];
                    
                    return Container(
                     
                      child: ListTile(
                      
                        title: Text(person.name),
                        subtitle: Text(person.email),
                        trailing:  IconButton(
                          
            onPressed: () {
              setState(() {
              salesperson = people[index].name;
                            email = people[index].email;
            });
              bottomsheet(context);
            },
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
                        
                      ),
                    );
                  },
                ),
              ),
              
            ],
          );
        },
      ),
    ));
  }
  
}

// void bottomsheet(BuildContext context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           // height: 670,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 dense: true,
//                 title: Text(
//                   'Options',
//                   style: TextStyle(
//                     fontSize: 17,
//                   ),
//                 ),
//                 tileColor: Colors.grey[100],
//               ),
//               InkWell(
//                 onTap: () {
//                   converttohot();
//                 },
//                 child: ListTile(
//                   dense: true,
//                   title: Row(
//                     children: [
//                      Icon(
//                       Icons.whatshot,
//                       color: Colors.red,
//                     ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text('Convert to HOT LEAD'),
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(thickness: 2, height: 5),
//               InkWell(
//                 onTap: () {
//                   coverttocold();
//                 },
//                 child: ListTile(
//                   dense: true,
//                   title: Row(
//                     children: [
//                       Icon(
//                       Icons.whatshot,
//                       color: Colors.grey,
//                     ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text('Convert to COLD LEAD'),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       });
// }