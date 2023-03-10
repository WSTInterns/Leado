import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'files.dart';
import 'pages.dart';
import 'product.dart';
// import 'template_body.dart';
// import 'upload_file.dart';
// import 'template_body.dart';
import 'newmessage_template.dart';
import 'edit_template.dart';
import 'pages.dart';

import './images.dart';

class MyAppAk extends StatelessWidget {
  const MyAppAk({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_switchTabIndex);
  }

  void _switchTabIndex() {
    print(_tabController.index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            floatingActionButton: _tabController.index == 0
                ? FloatingActionButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewTemplate())),
                    // onPressed: () => Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) => NewTemplate())),
                    backgroundColor: Color(0xffA85CF9),
                    child: Icon(Icons.add),
                  )
                : null,

            // floatingActionButton: FloatingActionButton(
            //     foregroundColor: Colors.black,
            //     child: Icon(Icons.add),
            //     onPressed: () {
            //       Navigator.of(context).pushReplacement(MaterialPageRoute(
            //           builder: (BuildContext context) => NewTemplate()));
            //     }),
            backgroundColor: Colors.grey,
            appBar: AppBar(
              backgroundColor: Color(0xffA85CF9),
              title: Container(
                //alignment: Alignment.topLeft,
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search for something',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xffA85CF9),
                      ),
                    ),
                  ),
                ),
              ),
              centerTitle: true,
              bottom: TabBar(
                labelColor: Colors.white, //<-- selected text color
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.white, //<-- Unselected text color
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: 'Messages',
                  ),
                  Tab(
                    text: 'Files',
                  ),
                  Tab(
                    text: 'Pages',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Center(
                  child: templates(),
                ),
                Center(
                  child: Wid(),
                ),
                Center(child: pages())
              ],
              // children: <Widget>[
              //   Center(child: templates()),
              //   Center(
              //     child: Files(),
              //   )
              // ],
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}

class templates extends StatelessWidget {
  // String? title, message;
  // const templates({super.key});

  // templates({this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color(0xffefefef),
            body: Column(
              children: [
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Sorting by Title [A-Z]',
                            style: (TextStyle(
                              fontSize: 14,
                            ))),
                        IconButton(
                          onPressed: () {
                            bottomsheet(context);
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 27,
                          ),
                          padding: EdgeInsets.only(left: 95),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 3,
                ),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 7),
                  transform: Matrix4.translationValues(0.0, -43.0, 0.0),
                  child: Column(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(left: 5, top: 15),
                              child: Text(
                                'Example 1-Introduction-ACME Residences',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            subtitle: Padding(
                              padding:
                                  EdgeInsets.only(left: 5, top: 6, bottom: 4),
                              child: Text(
                                'Hi,Thank you for your interest in ACME residences.',
                                style: TextStyle(fontSize: 12.5),
                              ),
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(top: 7, left: 7),
                              child: IconButton(
                                icon: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditTemplate())),
                              ),
                            ),
                            tileColor: Colors.white,
                          )
                        ],
                      ),
                      StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("message").snapshots(),
                builder: ((context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: ((context, int index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        return Row(
                          children: [
                            Expanded(
                              child: Text(documentSnapshot["title"]),
                            ),
                            Expanded(
                              child:
                                  Text(documentSnapshot["message"]),
                            ),
                          ],
                        );
                      }),
                    );
                  } else {
                    return Text('data not found');
                  }
                }),
              )
                    ],
                  ),
                ),

                // Container(
                //   child: Text('Title:' + title.toString()),
                // )
              ],
            )));
  }
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
              title: Text('Sorting content by'),
              tileColor: Colors.grey[100],
            ),
            ListTile(
              dense: true,
              title: Text('Message title (A-Z)'),
            ),
            Divider(thickness: 2, height: 5),
            ListTile(
              dense: true,
              title: Text('Message title (Z-A)'),
            ),
            Divider(thickness: 2, height: 5),
            ListTile(
              dense: true,
              title: Text('Most Recently Used'),
            ),
            Divider(thickness: 2, height: 5),
            ListTile(
              dense: true,
              title: Text('Date Created (Newest First)'),
            ),
            Divider(thickness: 2, height: 5),
            ListTile(
              dense: true,
              title: Text('Date Created (Oldest First)'),
            ),
          ],
        ));
      });
}

// final actionSheet = CupertinoActionSheet(
//     title: Text(
//       'Sort content by',
//       style: TextStyle(fontSize: 20),
//     ),
//     actions: <Widget>[
//       CupertinoActionSheetAction(
//         onPressed: () {},
//         child: Text(
//           "Message Title(A-Z)",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       CupertinoActionSheetAction(
//           onPressed: () {},
//           child: Text(
//             'Message Title(Z-A)',
//             style: TextStyle(color: Colors.black),
//           )),
//       CupertinoActionSheetAction(
//           onPressed: () {},
//           child: Text(
//             'Most Recently Used',
//             style: TextStyle(color: Colors.black),
//           )),
//       CupertinoActionSheetAction(
//           onPressed: () {},
//           child: Text(
//             'Data Created (Newest First)',
//             style: TextStyle(color: Colors.black),
//           )),
//       CupertinoActionSheetAction(
//           onPressed: () {},
//           child: Text(
//             'Data Created (Newest First)',
//             style: TextStyle(color: Colors.black),
//           )),
//     ]);
