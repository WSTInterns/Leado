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

class LeadMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Leads Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/secondPage': (context) => SecondPage(),
        '/thirdPage': (context) => ThirdPage(),
      },
    );
  }
}

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
          InkWell(
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
                    'Hot Leads',
                    style: TextStyle(fontSize: 24),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                  )
                ],
              ),
            ),
            onTap: () {
              Get.to(() => HotLeads());
            },
          ),
          SizedBox(height: 30),
          InkWell(
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
                    'Warm Leads',
                    style: TextStyle(fontSize: 24),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            onTap: () {
              Get.to(() => SecondPage());
            },
          ),
          SizedBox(height: 30),
          InkWell(
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
                    'Cold Leads',
                    style: TextStyle(fontSize: 24),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            onTap: () {
              Get.to(() => ThirdPage());
            },
          ),
        ],
      ),
    );
  }
}
