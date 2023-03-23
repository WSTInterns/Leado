import 'package:flutter/material.dart';

import 'package:brew_crew/screens/home/phone.dart';
import 'package:brew_crew/screens/home/homescreen.dart';

class StoreContact extends StatefulWidget {
  const StoreContact(this.title, this.number, {super.key});

  final String title;
  final String number;

  @override
  State<StoreContact> createState() => _StoreContactState();
}

class _StoreContactState extends State<StoreContact> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.title);
    print(widget.number);
    nameController.text = widget.title;
    numberController.text = widget.number;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text('Add New Client',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.black,
              tooltip: 'Show Snackbar',
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomeBar(title: "",)));
              })),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 35.5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 0, right: 15, top: 0),
              child: Text(
                "CLIENT NAME",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2.5, color: Color(0xffD9ACF5)),
                  ),
                  // hintText: 'Enter a search term',
                ),
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 0, right: 15, top: 0),
              child: Text(
                "DISPLAY NAME",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2.5, color: Color(0xffD9ACF5)),
                  ),
                  hintText: 'eg. abc',
                ),
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 0, right: 15, top: 0),
              child: Text(
                "PHONE NUMBER",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                controller: numberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.black),
                  // ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2.5, color: Color(0xffD9ACF5)),
                  ),
                  // errorBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //       width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                  // ),
                  // border: OutlineInputBorder(),
                  // hintText: 'Enter the Phone Number',

                  // hintText: 'Ent',
                ),
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 0, right: 15, top: 0),
              child: Text(
                "EMAIL ADDRESS",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.black),
                  // ),

                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2.5, color: Color(0xffD9ACF5)),
                  ),
                  // errorBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //       width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                  // ),
                  // border: OutlineInputBorder(),
                  hintText: 'eg. abc@mail.com',

                  // hintText: 'Ent',
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xffA85CF9),
                ),
                child: const Center(
                    child: Text(
                  "ADD CLIENT",
                  style: TextStyle(
                    color: Color(0xffECF2FF),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
