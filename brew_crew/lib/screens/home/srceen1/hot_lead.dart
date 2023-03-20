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
  bool isChecked;

  Person({required this.name, required this.email, this.isChecked = false});
}

// class HotLeads extends StatefulWidget {
//   HotLeads({Key? key}) : super(key: key);
// // class HotLeads extends StatefulWidget {
// //   HotLeads({Key? key}) : super(key: key);

// //   @override
// //   _HotLeadsState createState() => _HotLeadsState();
// // }

// class _HotLeadsState extends State<HotLeads> {
//   String salesperson = '';
//   String salesmail = '';
//   int phonenumber = 0;
//   CollectionReference collectionReference =
//       FirebaseFirestore.instance.collection("name");

//   List<Person> _people = [
//     Person(name: 'John Doe', email: 'johndoe@example.com'),
//     Person(name: 'Jane Doe', email: 'janedoe@example.com'),
//     Person(name: 'Shreya', email: 'shreya@example.com'),
//     Person(name: 'Bob Smith', email: 'bobsmith@example.com'),
//     Person(name: 'Beni', email: 'beni@example.com'),
//     Person(name: 'Dob Rib', email: 'dob@example.com'),
//     Person(name: 'Avi Rane', email: 'avir@example.com'),
//     Person(name: 'Dob Rib', email: 'dob@example.com'),
//     Person(name: 'Avi Rane', email: 'avir@example.com'),
//     Person(name: 'Dob Rib', email: 'dob@example.com'),
//     Person(name: 'Avi Rane', email: 'avir@example.com'),
//   ];

// // class _HotLeadsState extends State<HotLeads> {
// //   String salesperson = '';
// //   String salesmail = '';
// //   int phonenumber = 0;
// //   CollectionReference collectionReference =
// //       FirebaseFirestore.instance.collection("Leads");

// //   final List<Person> people = [];
// //   Future<List<Person>> getUsers(people) async {
// //     QuerySnapshot querySnapshot =
// //         await FirebaseFirestore.instance.collection('Leads').get();
// //     querySnapshot.docs.forEach((doc) {
// //       String name = doc['name'];
// //       String email = doc['email'];
// //       String activity_status = doc['activity_status'];
// //       if (activity_status == 'hot') {
// //         people.add(Person(name: name, email: email));
// //       }

//   void navigateToMyHomePage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => MyHomePage()),
//     );
//   }

//   void _handleAddToSales() {
//     // Remove clients who have been converted to sales
//     _people.removeWhere((person) => person.isChecked);

// //       // people.add(Person(name: name, email: email));
// //     });
// //     return people;
// //   }

// //   Future myfun() async {
// //     await getUsers(people);
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     myfun();
// //   }

//     // Rebuild widget tree with updated list and button visibility
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'HOT LEADS',
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//         elevation: 0.0,

//         backgroundColor: Colors.white,
//         // backgroundColor: Color.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           color: Colors.black,
//           tooltip: 'Go back',
//           onPressed: () {
//             Navigator.pop(context);
//             Get.to(() => MyHomePage());
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _people.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _people[index].isChecked = !_people[index].isChecked;
//                           _showButton =
//                               _people.any((person) => person.isChecked);
//                         });
//                       },
//                       child: ListTile(
//                         leading: const Icon(Icons.person),
//                         title: Text(_people[index].name),
//                         subtitle: Text(_people[index].email),
//                         trailing: Checkbox(
//                           value: _people[index].isChecked,
//                           onChanged: (bool? value) {
//                             setState(() {
//                               _people[index].isChecked = value ?? false;
//                               if (_people[index].isChecked) {
//                                 _people
//                                     .where((person) => person != _people[index])
//                                     .forEach(
//                                         (person) => person.isChecked = false);
//                               }
//                               _showButton =
//                                   _people.any((person) => person.isChecked);
//                               salesperson = _people[index].name;
//                               salesmail = _people[index].email;
//                             });
//                           },
//                           activeColor: Color(0XffA85CF9),
//                           checkColor: Colors.white,
//                         ),
//                         // onTap: () {
//                         // Do something when the user taps on the tile
//                         //},
//                       ));
//                 },
//               ),
//             ),
//             if (_showButton)
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) => CupertinoAlertDialog(
//                         content: const Text(
//                             'Do you want to convert these lead to sales?'),
//                         actions: [
//                           CupertinoDialogAction(
//                             child: const Text(
//                               'Yes',
//                               style: TextStyle(color: const Color(0XffA85CF9)),
//                             ),
//                             onPressed: () {
//                               Navigator.of(context)
//                                   .pushReplacement(MaterialPageRoute(
//                                       builder: (context) => HomePage(
//                                             title: 'Client Details',
//                                             email: salesmail,
//                                             salesnamefinal: salesperson,
//                                             phone: 7620,
//                                           ))); //abcd
//                               // Get.to(()=> navigateToMyHomePage());
//                               //  navigateToMyHomePage();
//                             },
//                           ),
//                           CupertinoDialogAction(
//                             child: const Text('No',
//                                 style:
//                                     TextStyle(color: const Color(0XffA85CF9))),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                   child: const Text('ADD TO SALES'),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         const Color(0XffA85CF9)),
//                     minimumSize: MaterialStateProperty.all(Size(600, 50)),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//   bool _showButton = false;

//   void navigateToMyHomePage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => MyHomePage()),
//     );
//   }

//   void _handleAddToSales() {
//     // Remove clients who have been converted to sales
//     people.removeWhere((person) => person.isChecked);

//     // Reset checkbox values to false
//     people.forEach((person) => person.isChecked = false);

//     // Hide "ADD TO SALES" button
//     _showButton = false;

//     // Rebuild widget tree with updated list and button visibility
//     setState(() {
//       getUsers(people);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'HOT LEADS',
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//         elevation: 0.0,

//         backgroundColor: Colors.white,
//         // backgroundColor: Color.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           color: Colors.black,
//           tooltip: 'Go back',
//           onPressed: () {
//             Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => MyHomePage()));
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: people.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           people[index].isChecked = !people[index].isChecked;
//                           _showButton =
//                               people.any((person) => person.isChecked);
//                         });
//                       },
//                       child: ListTile(
//                         leading: const Icon(Icons.person),
//                         title: Text(people[index].name),
//         subtitle: Text(people[index].email),
//         trailing: Checkbox(
//           value: people[index].isChecked,
//           onChanged: (bool? value) {
//             setState(() {
//               people[index].isChecked = value ?? false;
//               if (people[index].isChecked) {
//                 people
//                     .where((person) => person != people[index])
//                     .forEach(
//                         (person) => person.isChecked = false);
//               }
//               _showButton =
//                   people.any((person) => person.isChecked);
//               salesperson = people[index].name;
//               salesmail = people[index].email;
//             });
//           },
//           activeColor: Color(0XffA85CF9),
//           checkColor: Colors.white,
//         ),
//         // onTap: () {
//         // Do something when the user taps on the tile
//         //},
//       ));
// },
//               ),
//             ),
// if (_showButton)
//   Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: ElevatedButton(
//       onPressed: () {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) => CupertinoAlertDialog(
//             content: const Text(
//                 'Do you want to convert these lead to sales?'),
//             actions: [
//               CupertinoDialogAction(
//                 child: const Text(
//                   'Yes',
//                   style: TextStyle(color: const Color(0XffA85CF9)),
//                 ),
//                 onPressed: () {
//                   Navigator.of(context)
//                       .pushReplacement(MaterialPageRoute(
//                           builder: (context) => HomePage(
//                                 title: 'Client Details',
//                                 email: salesmail,
//                                 salesnamefinal: salesperson,
//                                 phone: 7620,
//                               ))); //abcd
//                   // Get.to(()=> navigateToMyHomePage());
//                   //  navigateToMyHomePage();
//                 },
//               ),
//               CupertinoDialogAction(
//                 child: const Text('No',
//                     style:
//                         TextStyle(color: const Color(0XffA85CF9))),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//       child: const Text('ADD TO SALES'),
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all<Color>(
//             const Color(0XffA85CF9)),
//         minimumSize: MaterialStateProperty.all(Size(600, 50)),
//       ),
//     ),
//   ),
//   ],
// ),
//       ),
//     );
//   }
// }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'clientside.dart' ;
// import 'package:get/get.dart';
// import 'package:brew_crew/screens/home/srceen1/leadmain.dart';

// class Person {
//   final String name;
//   final String email;
//   bool isChecked;

//   Person({required this.name, required this.email, this.isChecked = false});
// }

// class HotLeads extends StatefulWidget {
//    HotLeads({Key? key}) : super(key: key);

//   @override
//   _HotLeadsState createState() => _HotLeadsState();
// }

// class _HotLeadsState extends State<HotLeads> {
//   String salesperson= '';
//   String salesmail= '';
//   int phonenumber= 0;
//   List<Person> people = [
//     Person(name: 'John Doe', email: 'johndoe@example.com'),
//     Person(name: 'Jane Doe', email: 'janedoe@example.com'),
//     Person(name: 'Shreya', email: 'shreya@example.com'),
//     Person(name: 'Bob Smith', email: 'bobsmith@example.com'),
//     Person(name: 'Beni', email: 'beni@example.com'),
//     Person(name: 'Dob Rib', email: 'dob@example.com'),
//     Person(name: 'Avi Rane', email: 'avir@example.com'),
//     Person(name: 'Dob Rib', email: 'dob@example.com'),
//     Person(name: 'Avi Rane', email: 'avir@example.com'),
//     Person(name: 'Dob Rib', email: 'dob@example.com'),
//     Person(name: 'Avi Rane', email: 'avir@example.com'),
//   ];

//   bool _showButton = false;

//   void navigateToMyHomePage() {
//     Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => LeadMain()),
//      );
//   }
//      void _handleAddToSales() {
//     // Remove clients who have been converted to sales
//     people.removeWhere((person) => person.isChecked);

//     // Reset checkbox values to false
//     people.forEach((person) => person.isChecked = false);

//     // Hide "ADD TO SALES" button
//     _showButton = false;

//     // Rebuild widget tree with updated list and button visibility
//     setState(() {});
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HOT LEADS',
//         style:TextStyle(
//           color:Colors.black,
//         ),

//         ),
//         elevation: 0.0,

//          backgroundColor: Colors.white,
//        // backgroundColor: Color.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           color: Colors.black,
//           tooltip: 'Go back',

//           onPressed: () {
//             Navigator.pop(context);
//             Get.to(()=> MyHomePage());

//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: people.length,
//                 itemBuilder: (context, index) {
//                   return  GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       people[index].isChecked = !people[index].isChecked;
//                       _showButton = people.any((person) => person.isChecked);

//                   });
//                   },

//                   child: ListTile(
//                     leading: const Icon(Icons.person),
//                     title: Text(people[index].name),
//                     subtitle: Text(people[index].email),
//                     trailing: Checkbox(
//                       value: people[index].isChecked,
//                       onChanged: (bool? value) {
//                         setState(() {
//                           people[index].isChecked = value ?? false;
//                            if (people[index].isChecked) {
//                             people.where((person) => person != people[index]).forEach((person) => person.isChecked = false);}
//                             _showButton = people.any((person) => person.isChecked);
//                             salesperson = people[index].name;
//                             salesmail = people[index].email;
//                         });
//                       },
//                       activeColor: Color(0XffA85CF9),
//                       checkColor: Colors.white,
//                     ),
//                    // onTap: () {
//                       // Do something when the user taps on the tile
//                     //},
//                   ));
//                 },
//               ),
//             ),

//             if (_showButton)
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) => CupertinoAlertDialog(
//                         content: const Text('Do you want to convert these lead to sales?'),
//                         actions: [
//                           CupertinoDialogAction(
//                             child: const Text('Yes',
//                              style: TextStyle(color: const Color(0XffA85CF9)),

//                             ),
//                             onPressed: () {
//                               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(title: 'Client Details',email:salesmail,salesnamefinal: salesperson,phone: 7620,))); //abcd
//                               // Get.to(()=> navigateToMyHomePage());
//                             //  navigateToMyHomePage();
//                             },
//                           ),
//                           CupertinoDialogAction(
//                             child: const Text('No',
//                              style: TextStyle(color: const Color(0XffA85CF9))),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ],
//                       ),
//                     );
//                   },

//                   child: const Text('ADD TO SALES'),
//                   style: ButtonStyle(
//                     backgroundColor:  MaterialStateProperty.all<Color>(const Color(0XffA85CF9)),
//                     minimumSize: MaterialStateProperty.all(Size(600, 50)),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//CCCCCCCCHHHHHHHHHHHHHAAAAAAAAAATTTTTTTGGGGGGPPPPPPPPPPTTTTTTTTTTcHATGPT
class HotLeads extends StatefulWidget {
  @override
  State<HotLeads> createState() => _HotLeadsState();
}

class _HotLeadsState extends State<HotLeads> {
  String salesperson = '';
  String salesmail = '';
  int phonenumber = 0;
  bool _showButton = false;
  final CollectionReference leadsCollection =
      FirebaseFirestore.instance.collection('Leads');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Hot Leads',
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontFamily: "Helvetica",
          ),
        ),
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
                    builder: (context) => MyHomePage(
                          title: 'Leads',
                        )));
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 26, 15, 10),
        child: StreamBuilder<QuerySnapshot>(
          stream: leadsCollection
              .where('activity_status', isEqualTo: 'hot')
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
              return Person(name: name, email: email);
            }).toList();

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: people.length,
                    itemBuilder: (context, index) {
                      final person = people[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            people[index].isChecked = !people[index].isChecked;
                            _showButton =
                                people.any((person) => person.isChecked);
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(50, 50, 93, 0.25)
                                    .withOpacity(0.1),
                                // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 20,
                                offset: const Offset(
                                    0, 8), // changes position of shadow
                              ),
                            ],
                          ),
                          child: CheckboxListTile(
                            selected: person.isChecked,
                            value: person.isChecked,
                            title: Text(person.name),
                            subtitle: Text(person.email),
                            onChanged: (bool? newValue) {
                              // Update the isChecked value of the person
                              // Rebuild the widget tree to reflect the change
                              setState(() {
                                person.isChecked = newValue ?? false;
                                if (people[index].isChecked) {
                                  people
                                      .where(
                                          (person) => person != people[index])
                                      .forEach(
                                          (person) => person.isChecked = false);
                                }
                                _showButton =
                                    people.any((person) => person.isChecked);
                                salesperson = people[index].name;
                                salesmail = people[index].email;
                              });
                            },
                            activeColor: Color(0XffA85CF9),
                            checkColor: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (people.any((person) => person.isChecked))
                  ElevatedButton(
                    onPressed: () {
                      // Remove checked items
                      people.removeWhere((person) => person.isChecked);

                      // Rebuild the widget tree to reflect the change
                      setState(() {});
                    },
                    child: const Text('Remove Selected'),
                  ),
                if (_showButton)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              CupertinoAlertDialog(
                            content: const Text(
                                'Do you want to convert these lead to sales?'),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text(
                                  'Yes',
                                  style:
                                      TextStyle(color: const Color(0XffA85CF9)),
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (context) => HomePage(
                                                title: 'Client Details',
                                                email: salesmail,
                                                salesnamefinal: salesperson,
                                                phone: 7620,
                                              ))); //abcd
                                },
                              ),
                              CupertinoDialogAction(
                                child: const Text('No',
                                    style: TextStyle(
                                        color: const Color(0XffA85CF9))),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('ADD TO SALES'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0XffA85CF9)),
                        minimumSize: MaterialStateProperty.all(Size(600, 50)),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
