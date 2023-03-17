import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'hot_lead.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cold Leads',
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Text('Cold Leads are here.'),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warm Leads',
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Warm leads are here'),
      ),
    );
  }
}

// class LeadMain extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Leads Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: MyHomePage(),
//       routes: <String, WidgetBuilder>{
//         '/secondPage': (context) => SecondPage(),
//         '/thirdPage': (context) => ThirdPage(),
//       },
//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Leads',
      //       style: TextStyle(
      //         color: Colors.black,
      //       )),
      //   backgroundColor: Colors.white,
      // ),

      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          SizedBox(
            height: 17,
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(50, 50, 93, 0.25)
                        .withOpacity(0.08),
                    // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: const Offset(0, 8), // changes position of shadow
                  ),
                ],
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 50,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.whatshot,
                      color: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'HOT LEADS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              // Get.to(() => HotLeads());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HotLeads(),
                ),
              );
            },
          ),
          SizedBox(height: 10),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(50, 50, 93, 0.25)
                        .withOpacity(0.08),
                    // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: const Offset(0, 8), // changes position of shadow
                  ),
                ],
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 50,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.whatshot,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'WARM LEADS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            onTap: () {
              // Get.to(() => SecondPage());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(),
                ),
              );
            },
          ),
          SizedBox(height: 10),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(50, 50, 93, 0.25)
                        .withOpacity(0.08),
                    // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: const Offset(0, 8), // changes position of shadow
                  ),
                ],
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 50,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.whatshot,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'COLD LEADS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            onTap: () {
              // Get.to(() => ThirdPage());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ThirdPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
