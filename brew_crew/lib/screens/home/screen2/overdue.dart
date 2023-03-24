import 'package:flutter/material.dart';
import 'followmain.dart';
import 'package:get/get.dart';

void main() {
  runApp(const overdue());
}

class overdue extends StatefulWidget {
  const overdue({super.key});

  @override
  State<overdue> createState() => _overdueState();
}

class _overdueState extends State<overdue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 168, 92, 249),
        title: Row(
          children: [
            // IconButton(
            //     onPressed: () {
            //       // Navigator.pushReplacement(
            //       //   context,
            //       //   MaterialPageRoute(builder: (context) => MyAppSak()),
            //       // );
            //       Navigator.pop(context);
            //     },
            //     icon: Icon(
            //       Icons.arrow_back_ios,
            //       color: Colors.black,
            //     )),
            Text(
              "   Overdue(0)",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
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
                    Icons.thumb_up,
                    color: Colors.black,
                  )),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "Way to go!",
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
                "You have no overdue follow ups",
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
