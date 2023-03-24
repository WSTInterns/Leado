import 'package:flutter/material.dart';
import 'followmain.dart';

void main() {
  runApp(const upcoming());
}

class upcoming extends StatefulWidget {
  const upcoming({super.key});

  @override
  State<upcoming> createState() => _upcomingState();
}

class _upcomingState extends State<upcoming> {
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
              "   Upcoming(0)",
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
                    color: Colors.black,
                  )),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "No upcoming follow ups",
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
                "'Follow up' is useful to plan out what's next for a particular client -have coffee, schedule a meeting, or anything else to keep things going",
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
