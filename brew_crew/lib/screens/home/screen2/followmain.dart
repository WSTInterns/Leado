import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'followUp3.dart';
import 'overdue.dart';
import 'someday.dart';
import 'upcoming.dart';

// class MyAppSak extends StatelessWidget {
//   const MyAppSak({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: const MyAppSak(title: 'Flutter Demo Home Page'),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class MyAppSak extends StatefulWidget {
  const MyAppSak({super.key});
  @override
  State<MyAppSak> createState() => _MyAppSakState();
}

class _MyAppSakState extends State<MyAppSak> {
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Container(
              child: Center(
                child: Text(
                  "Follow Ups",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Container(
              height: 5,
              color: Color(0xffEFEFEF),
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => overdue()),
                );
              },
              child: Container(
                height: 50,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            "OVERDUE",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                ),
              )),
          Container(height: 2, color: Color(0xffEFEFEF)),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => upcoming()),
                );
              },
              child: Container(
                color: Colors.white,
                height: 50,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            "UPCOMING",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              )),
          Container(height: 2, color: Color(0xffEFEFEF)),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => someday()),
                );
              },
              child: Container(
                height: 50,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            "SOMEDAY",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blueGrey,
                        )
                      ],
                    ),
                  ),
                ),
              )),
          Container(
            height: 8,
            color: Color(0xffEFEFEF),
          ),
          Container(
            color: Colors.white,
            height: 50,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Icon(
                        Icons.calendar_today,
                        color: Color.fromARGB(255, 4, 54, 78),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        "TODAY",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 4, 54, 78),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => clientProf()),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(2),
              child: ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundColor: Color(0xffA85CF9),
                  radius: 20,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                title: Text("Privyr Support"),
                subtitle: Row(
                  children: [
                    Text("Due today"),
                    Spacer(),
                  ],
                ),
                trailing: CupertinoButton(
                  onPressed: () => _showActionSheet(context),
                  child: const Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          )
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  DateTime? _chosenDateTime;

// Show the modal that contains the CupertinoDatePicker
  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 350,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          // setState(() {
                          // _chosenDateTime = val;
                          //});
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Schedule follow up for Client'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// defualt behavior, turns the action's text to bold text.

            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Today',
              style: TextStyle(
                  color: Color.fromARGB(255, 132, 131, 131), fontSize: 15),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Tomorrow',
              style: TextStyle(
                  color: Color.fromARGB(255, 132, 131, 131), fontSize: 15),
            ),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as delete or exit and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              '3 days from now',
              style: TextStyle(
                  color: Color.fromARGB(255, 132, 131, 131), fontSize: 15),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              '1 week from now',
              style: TextStyle(
                  color: Color.fromARGB(255, 132, 131, 131), fontSize: 15),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              '1 month from now',
              style: TextStyle(
                  color: Color.fromARGB(255, 132, 131, 131), fontSize: 15),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () => _showDatePicker(context),
            child: const Text(
              'Select custom date and time',
              style: TextStyle(
                  color: Color.fromARGB(255, 132, 131, 131), fontSize: 15),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Someday',
              style: TextStyle(
                  color: Color.fromARGB(255, 132, 131, 131), fontSize: 15),
            ),
          ),
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Never ',
              style: TextStyle(
                  color: Color.fromARGB(255, 132, 131, 131), fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
