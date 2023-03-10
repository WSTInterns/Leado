import 'package:brew_crew/screens/home/homescreen.dart';
import 'package:brew_crew/screens/home/phone.dart';
import 'package:flutter/material.dart';
import './excel.dart';

class UploadExcel extends StatelessWidget {
  const UploadExcel({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UploadExcelPage(),
    );
  }
}

class UploadExcelPage extends StatelessWidget {
  const UploadExcelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shape: const Border(
        //   bottom: BorderSide(
        //     color: Color.fromRGBO(50, 50, 93, 0.25),
        //     width: 0.3,
        //   ),
        // ),
        backgroundColor: Colors.white,
        title: const Text(
          'UPLOAD EXCEL',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          tooltip: 'Show Snackbar',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeBar()));
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: [
            SizedBox(
              height: 38,
            ),
            Container(
              padding: const EdgeInsets.all(20),

              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    // color:
                    //     const Color.fromRGBO(50, 50, 93, 0.25).withOpacity(0.1),
                    color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: const Offset(0, 8), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.article_outlined,
                    size: 35,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      "DOWNLOAD TEMPLATE",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(Icons.download),
                ],
              ),
              // : EdgeInsets.all(5),
            ),
            SizedBox(
              height: 23,
            ),
            const Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 23,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => const Excel()));
              },
              child: Container(
                // margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xffA85CF9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "UPLOAD EXCEL",
                    style: TextStyle(
                      color: Color(0xffECF2FF),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xffffffff),
    );
  }
}
