import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'contentmain.dart';
// import 'package:flutter_websoft/template_body.dart';
// import './data.dart';
// import './template_body.dart';

void main() {
  runApp(NewTemplate());
}

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: NewTemplate());
//   }
// }

class NewTemplate extends StatefulWidget {
  // List<Data> data = List.empty(growable: true);

  // NewTemplate({required this.data});

  @override
  State<NewTemplate> createState() => _NewTemplateState();
}

class _NewTemplateState extends State<NewTemplate> {
  // TextEditingController titleController = TextEditingController();
  // String title = '';
  // TextEditingController messageController = TextEditingController();
  // String message = '';

  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();

  String message = '',title = '';

  late String form1Value;
  late String form2Value;

  getMessage(String message){
    this.message= message;
  }
  getTitle(String title){
    this.title= title ;
  }

  createMessage() async{
    DocumentReference doc = await FirebaseFirestore.instance.collection("message").doc(title);
    Map<String,dynamic> messages = {
      "title" : title,
      "message" : message,
    };
    doc.set(messages).whenComplete(() => {print("Saved Message")});
  }

  // void validate() {
  //   if (_formkey1.currentState!.validate()) {
  //     print('ok');
  //   } else {
  //     print('Error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
                Text(
                  "New Message Template",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 20, 4),
                    child: Text(
                      "Title",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Form(
                    key: _formkey1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: TextFormField(
                            onChanged: (value) => getTitle(value),

                        // controller: titleController,
                        maxLines: null,
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return 'Please enter some text';
                          // }
                          // return null;
                          if (value!.isEmpty) {
                            return "Required";
                          } else {
                            return null;
                          }
                          ;
                          onSaved:
                          (value) => form1Value = value;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'e.g.Ask for coffee in next 3 days',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 20, 2),
                    child: Text(
                      "Template Message",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Form(
                    key: _formkey2,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: TextFormField(
                        onChanged: (value) => getMessage(value),
                        maxLines: null,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          } else {
                            return null;
                          }
                          ;
                          onSaved:
                          (value) => form2Value = value;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'Hi @clientname...',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 9, 10, 6),
                      child: InkWell(
                        onTap: () {
                          // Do something when the user taps the widget
                        },
                        child: Center(
                            child: Container(
                          width: 310,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                bool _form1Valid =
                                    _formkey1.currentState!.validate();
                                bool _form2Valid =
                                    _formkey2.currentState!.validate();

                                if (_form1Valid && _form2Valid) {
                                  _formkey1.currentState!.save();
                                  _formkey2.currentState!.save();
                                  createMessage();
                                }
                              },
                              child: Text(
                                'CREATE  MESSAGE',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xffA85CF9)))),
                        )),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
