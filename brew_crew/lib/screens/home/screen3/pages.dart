import 'package:flutter/material.dart';
import 'product.dart';

class pages extends StatefulWidget {
  const pages({super.key});

  @override
  State<pages> createState() => _pagesState();
}

class _pagesState extends State<pages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductScreen())),
              // onPressed: () => Navigator.of(context).pushReplacement(
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => NewTemplate())),
              backgroundColor: Color(0xffA85CF9),
              child: Icon(Icons.add),
            ),
            backgroundColor: Colors.grey,
            body: Column(
              children: [
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 7),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 4, 15, 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Sorting by Title [A-Z]',
                            style: (TextStyle(fontSize: 10))),
                        IconButton(
                          onPressed: () {
                            bottomsheet(context);
                          },
                          icon: Icon(Icons.keyboard_arrow_down),
                          padding: EdgeInsets.only(left: 154),
                        ),
                      ],
                    ),
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
