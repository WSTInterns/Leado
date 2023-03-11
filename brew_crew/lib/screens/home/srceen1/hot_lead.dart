import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'clientside.dart' ;
import 'package:get/get.dart';
import 'package:brew_crew/screens/home/srceen1/leadmain.dart';

class Person {
  final String name;
  final String email;
  bool isChecked;

  Person({required this.name, required this.email, this.isChecked = false});
}

class HotLeads extends StatefulWidget {
   HotLeads({Key? key}) : super(key: key);
  

  @override
  _HotLeadsState createState() => _HotLeadsState();
}

class _HotLeadsState extends State<HotLeads> {
  String salesperson= '';
  String salesmail= '';
  int phonenumber= 0;
  CollectionReference collectionReference= FirebaseFirestore.instance.collection("name");
  
  List<Person> _people = [
    Person(name: 'John Doe', email: 'johndoe@example.com'),
    Person(name: 'Jane Doe', email: 'janedoe@example.com'),
    Person(name: 'Shreya', email: 'shreya@example.com'),
    Person(name: 'Bob Smith', email: 'bobsmith@example.com'),
    Person(name: 'Beni', email: 'beni@example.com'),
    Person(name: 'Dob Rib', email: 'dob@example.com'),
    Person(name: 'Avi Rane', email: 'avir@example.com'),
    Person(name: 'Dob Rib', email: 'dob@example.com'),
    Person(name: 'Avi Rane', email: 'avir@example.com'),
    Person(name: 'Dob Rib', email: 'dob@example.com'),
    Person(name: 'Avi Rane', email: 'avir@example.com'),
  ];

  bool _showButton = false;

  void navigateToMyHomePage() {
    Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => LeadMain()),
     );
  }
     void _handleAddToSales() {
    // Remove clients who have been converted to sales
    _people.removeWhere((person) => person.isChecked);

    // Reset checkbox values to false
    _people.forEach((person) => person.isChecked = false);

    // Hide "ADD TO SALES" button
    _showButton = false;

    // Rebuild widget tree with updated list and button visibility
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOT LEADS',
        style:TextStyle(
          color:Colors.black,
        ),
        

        ),
        elevation: 0.0,
        
         backgroundColor: Colors.white,
       // backgroundColor: Color.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          tooltip: 'Go back',
          
          onPressed: () {
            Navigator.pop(context); 
            Get.to(()=> MyHomePage());
            
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _people.length,
                itemBuilder: (context, index) {
                  return  GestureDetector(
                  onTap: () {
                    setState(() {
                      _people[index].isChecked = !_people[index].isChecked;
                      _showButton = _people.any((person) => person.isChecked);
                      
                  });
                  },
                  
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(_people[index].name),
                    subtitle: Text(_people[index].email),
                    trailing: Checkbox(
                      value: _people[index].isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _people[index].isChecked = value ?? false;
                           if (_people[index].isChecked) {
                            _people.where((person) => person != _people[index]).forEach((person) => person.isChecked = false);}
                            _showButton = _people.any((person) => person.isChecked);
                            salesperson = _people[index].name;
                            salesmail = _people[index].email;
                        });
                      },
                      activeColor: Color(0XffA85CF9),
                      checkColor: Colors.white,
                    ),
                   // onTap: () {
                      // Do something when the user taps on the tile
                    //},
                  ));
                },
              ),
            ),
      
            if (_showButton)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        content: const Text('Do you want to convert these lead to sales?'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('Yes',
                             style: TextStyle(color: const Color(0XffA85CF9)),
                            
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(title: 'Client Details',email:salesmail,salesnamefinal: salesperson,phone: 7620,))); //abcd
                              // Get.to(()=> navigateToMyHomePage());
                            //  navigateToMyHomePage();
                            },
                          ),
                          CupertinoDialogAction(
                            child: const Text('No',
                             style: TextStyle(color: const Color(0XffA85CF9))),
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
                    backgroundColor:  MaterialStateProperty.all<Color>(const Color(0XffA85CF9)),
                    minimumSize: MaterialStateProperty.all(Size(600, 50)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
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

//   bool _showButton = false;

//   void navigateToMyHomePage() {
//     Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => LeadMain()),
//      );
//   }
//      void _handleAddToSales() {
//     // Remove clients who have been converted to sales
//     _people.removeWhere((person) => person.isChecked);

//     // Reset checkbox values to false
//     _people.forEach((person) => person.isChecked = false);

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
//                 itemCount: _people.length,
//                 itemBuilder: (context, index) {
//                   return  GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _people[index].isChecked = !_people[index].isChecked;
//                       _showButton = _people.any((person) => person.isChecked);
                      
//                   });
//                   },
                  
//                   child: ListTile(
//                     leading: const Icon(Icons.person),
//                     title: Text(_people[index].name),
//                     subtitle: Text(_people[index].email),
//                     trailing: Checkbox(
//                       value: _people[index].isChecked,
//                       onChanged: (bool? value) {
//                         setState(() {
//                           _people[index].isChecked = value ?? false;
//                            if (_people[index].isChecked) {
//                             _people.where((person) => person != _people[index]).forEach((person) => person.isChecked = false);}
//                             _showButton = _people.any((person) => person.isChecked);
//                             salesperson = _people[index].name;
//                             salesmail = _people[index].email;
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
