import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

//import 'package:validate/main.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleName = TextEditingController();
  final TextEditingController DescriptionName = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? pickedImage;
  String base64Image = "";
  // File? selectedImage;
  // String base64Image = "";

  // Future<void> _chooseImage(type) async {
  //   // ignore: prefer_typing_uninitialized_variables
  //   var image;
  //   if (type == "camera") {
  //     image = await ImagePicker()
  //         .pickImage(source: ImageSource.camera, imageQuality: 10);
  //   } else {
  //     image = await ImagePicker()
  //         .pickImage(source: ImageSource.gallery, imageQuality: 25);
  //   }
  //   if (image != null) {
  //     setState(() {
  //       selectedImage = File(image.path);
  //       base64Image = base64Encode(selectedImage!.readAsBytesSync());
  //       // won't have any error now
  //     });
  //   }
  // }

  // void _showActionSheet(BuildContext context) {
  //   showCupertinoModalPopup<void>(
  //     context: context,
  //     builder: (BuildContext context) => CupertinoActionSheet(
  //       title: const Text(
  //         'Add photos',
  //         textAlign: TextAlign.left,
  //       ),
  //       actions: <CupertinoActionSheetAction>[
  //         CupertinoActionSheetAction(

  //             /// This parameter indicates the action would be a default
  //             /// defualt behavior, turns the action's text to bold text.

  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Row(
  //               children: [
  //                 Padding(
  //                     padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
  //                     child: Icon(Icons.camera)),
  //                 Padding(
  //                   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
  //                   child: Text("Take from camera"),
  //                 )
  //               ],
  //             )),
  //         CupertinoActionSheetAction(
  //             onPressed: () {
  //               Navigator.pop(_chooseImage("camera"));
  //             },
  //             child: Row(
  //               children: [
  //                 Padding(
  //                     padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
  //                     child: Icon(Icons.photo)),
  //                 Padding(
  //                   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
  //                   child: Text("Select from gallery"),
  //                 )
  //               ],
  //             )),
  //       ],
  //     ),
  //   );
  // }

  // void imagePickerOption() {
  //   Get.bottomSheet(
  //     SingleChildScrollView(
  //       child: ClipRRect(
  //         borderRadius: const BorderRadius.only(
  //           topLeft: Radius.circular(10.0),
  //           topRight: Radius.circular(10.0),
  //         ),
  //         child: Container(
  //           color: Colors.white,
  //           height: 250,
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: [
  //                 const Text(
  //                   "Pic Image From",
  //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                   textAlign: TextAlign.center,
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 ElevatedButton.icon(
  //                   onPressed: () {
  //                     pickImage(ImageSource.camera);
  //                   },
  //                   icon: const Icon(Icons.camera),
  //                   label: const Text("CAMERA"),
  //                 ),
  //                 ElevatedButton.icon(
  //                   onPressed: () {
  //                     pickImage(ImageSource.gallery);
  //                   },
  //                   icon: const Icon(Icons.image),
  //                   label: const Text("GALLERY"),
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 ElevatedButton.icon(
  //                   onPressed: () {
  //                     Get.back();
  //                   },
  //                   icon: const Icon(Icons.close),
  //                   label: const Text("CANCEL"),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _bottomsheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (contxt) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: 200,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Add Photos'),
                    // onTap: () {
                    //   // Navigator.pop(context);
                    //   pickImage(ImageSource.gallery);
                    // },
                  ),
                  ListTile(
                    leading: Icon(Icons.camera),
                    title: Text('Take from camera'),
                    onTap: () {
                      // Navigator.pop(context);
                      pickImage(ImageSource.camera);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Select from gallery'),
                    onTap: () {
                      // Navigator.pop(context);
                      pickImage(ImageSource.gallery);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
        base64Image = base64Encode(pickedImage!.readAsBytesSync());
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Product or Event Page',
              style: TextStyle(
                  color: Color.fromARGB(255, 15, 10, 10),
                  fontWeight: FontWeight.bold)),
          elevation: 0,
          backgroundColor: Color(0xffffffff),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.black,
              tooltip: 'Show Snackbar',
              onPressed: () {
                Navigator.pop(context);
              })),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const ListTile(
              leading: Text(
                "Title",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              trailing: Text("*Required"),
            ),

            const SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.all(3),
              child: TextFormField(
                controller: titleName,
                decoration: InputDecoration(
                  hintText: "Enter Title",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: Color(0xffD9ACF5)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    borderSide: const BorderSide(),
                  ),
                  hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),

            const ListTile(
              leading: Text(
                "Description",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),

            // Padding(
            //   padding:
            //       EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 20),
            //   child: Text(
            //     "ENTER THE MESSAGE",
            //     style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: TextFormField(
                controller: DescriptionName,
                maxLength: 500,
                expands: false,

                // minLines: 1,

                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: "Add description about your product or event...",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: Color(0xffD9ACF5)),
                  ),
                  // hintText: "Enter A Message Here",
                  hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            const ListTile(
              leading: Text(
                "Title",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              trailing: Text("Required"),
            ),

            //container

            Container(
              child: InkWell(
                //onTap: () => _showActionSheet(context),
                onTap: () => _bottomsheet(context),
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  color: Color(0xffffffff),
                  width: 48.0,
                  height: 80.0,

                  //
                  child: pickedImage != null
                      ? Image.file(
                          pickedImage!,
                          width: 170,
                          height: 170,
                          fit: BoxFit.cover,
                        )
                      // : Image.network(
                      //     'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                      //     width: 170,
                      //     height: 170,
                      //     fit: BoxFit.cover,
                      //   ),
                      : const Icon(Icons.photo_album_outlined),
                ),
              ),
            ),
            // validator: (value) {
            //       if (value == null || value.isEmpty) {
            //         return 'Please enter some text';
            //       }
            //       return null;
            //     },

            Container(
              margin: const EdgeInsets.fromLTRB(10, 18, 10, 20),
              child: ElevatedButton(
                // Validate returns true if the form is valid, or false otherwise.
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    print("Validated");
                    print(titleName.text);
                    print(DescriptionName.text);
                    print(
                        "Title Name ${titleName.text}, Description ${DescriptionName.text}");
                    Map userRequiredData = {
                      "title_name": titleName.text,
                      "description": DescriptionName.text
                    };
                  } else {
                    print("Please enter the title");
                  }
                },
                child: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffA85CF9),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  //margin: const EdgeInsets.all(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // Add TextFormFields and ElevatedButton here.
  }
}
