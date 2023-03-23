import 'package:brew_crew/screens/home/contents.dart';
import 'package:brew_crew/screens/home/homescreen.dart';
import 'package:brew_crew/screens/home/screen3/contentmain.dart';
import 'package:flutter/material.dart';

class MessageContentPage extends StatelessWidget {
  MessageContentPage({super.key, required this.message});
  String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Message title",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              bottomsheet(context);
            },
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
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
                          title: "",
                        )));
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                // color: const Color.fromRGBO(
                //         0, 0, 0, 0)
                //     .withOpacity(0.04),
                color: const Color.fromRGBO(50, 50, 93, 0.25).withOpacity(0.08),
                // color:
                //     const Color.fromRGBO(50, 50, 93, 0.25).withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 20,
                offset: const Offset(0, 8), // changes position of shadow
              ),
            ],
          ),
          child: Text(message),
        ),
      ),
    );
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
                title: Text(
                  'Options',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                tileColor: Colors.grey[100],
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  dense: true,
                  title: Row(
                    children: [
                      Icon(
                        Icons.edit_note,
                        size: 28,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Edit Message Content'),
                    ],
                  ),
                ),
              ),
              Divider(thickness: 2, height: 5),
              InkWell(
                onTap: () {},
                child: ListTile(
                  dense: true,
                  title: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        size: 26,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Delete Message Template'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
