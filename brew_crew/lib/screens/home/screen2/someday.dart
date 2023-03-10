import 'package:flutter/material.dart';
import 'followmain.dart';

void main() {
  runApp(const someday());
}

class someday extends StatefulWidget {
  const someday({super.key});

  @override
  State<someday> createState() => _somedayState();
}

class _somedayState extends State<someday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyAppSak()),
                  );
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            Text(
              "   Someday(0)",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Center(
              child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  )),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "No Follow ups due someday",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "Set a follow up to someday if you're unsure of when to be reminded. You can always change this later!",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
