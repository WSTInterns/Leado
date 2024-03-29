import 'package:flutter/material.dart';
import 'followUp3.dart';
import 'followmain.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const phonecalls());
}

class phonecalls extends StatefulWidget {
  const phonecalls({super.key});

  HomePages createState() => HomePages();
}

class HomePages extends State<phonecalls> {
  var _chosenDateTime;
  final dateFormat = DateFormat('d MMMM y   HH:mm');
  //print(DateFormat('d MMMM y').format(DateTime.now()))

  @override
  void initState() {
    super.initState();
    _chosenDateTime = dateFormat.format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Activity with Privyr Support",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffEFEFEF),
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => clientProf()),
              );
            },
          ),
          //systemOverlayStyle: SystemUiOverlayStyle(lig),
        ), //AppBar
        body: Container(
          color: Color(0xffEFEFEF),
          child: Column(
            children: [
              Container(
                height: 50,
                child: Row(
                  children: [
                    FloatingActionButton(
                      backgroundColor: Color(0xffA85CF9),
                      onPressed: null,
                      child: Icon(Icons.phone_enabled_outlined),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    ),
                    Center(
                      child: Text(
                        "Phone Call",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                height: 150,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: "Add optional details here...",
                    ),
                    maxLength: 50,
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  color: Colors.white,
                  child: InkWell(
                    onTap: () => _showDatePicker(context),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.access_time,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(_chosenDateTime.toString()),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Container(),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => clientProf()),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 18, 10, 20),
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xffA85CF9),
                      ),
                      child: const Center(
                        child: Text(
                          "ADD ACTIVITY",
                          style: TextStyle(
                            color: Color(0xffECF2FF),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }


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
                        // print('dateTime: $val');

                        // print(DateFormat('d MMMM y').format(DateTime.now()));
                        setState(() {
                        _chosenDateTime = dateFormat.format(val);
                        // print('dateTime: $val');
                        });
                      }),
                ),

                // Close the modal
                CupertinoButton(
                  child: const Text('Done'),
                  onPressed: () => Navigator.of(ctx).pop(),
                ),
              ],
            ),
          ));
}
}