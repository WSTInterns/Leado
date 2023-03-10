import 'package:flutter/material.dart';

void main() {
  runApp(EditTemplate());
}

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: EditTemplate(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class EditTemplate extends StatefulWidget {
  const EditTemplate({super.key});

  @override
  State<EditTemplate> createState() => _EditTemplateState();
}

class _EditTemplateState extends State<EditTemplate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
                  Text(
                    "{Title}",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 140),
                    child: TextButton(
                        onPressed: () {
                          bottomsheet(context);
                        },
                        child: Text(
                          "Options",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ],
              ),
            ),
            body: Center(
              child: SizedBox(
                height: 45,
                width: 270,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                  label: Text(
                    'SEND TO CLIENT',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xffA85CF9),
                    ),
                  ),
                ),
              ),
            )));
  }

  void bottomsheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                dense: true,
                title: Text(
                  'Options',
                  style: TextStyle(color: Colors.black),
                ),
                tileColor: Colors.grey[100],
              ),
              Divider(
                thickness: 2,
                height: 5,
              ),
              ListTile(
                leading: Icon(Icons.edit),
                dense: true,
                title: Text('Edit message Template'),
              ),
              Divider(thickness: 2, height: 5),
              ListTile(
                leading: Icon(Icons.delete),
                dense: true,
                title: Text(
                  'Delete message Template',
                ),
              ),
            ],
          );
        });
  }
}
