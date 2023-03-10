import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Moree extends StatelessWidget {
  const Moree({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          
          appBar: AppBar(
            title: const Center(child:Text("MORE",
            style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold,
            // fontSize: 22,
            
            ),
            ),
            ),
           backgroundColor: Colors.white,
           elevation: 0,
           
           
          ),
         body: _taskList(),
         
        ));
  }
  @override
Widget _taskList()
  {
    return Padding(
      padding:EdgeInsets.all(15.0) ,
      child: Column(
        
        children: [SizedBox(height: 25,),
          InkWell(
            onTap: () {},
            child: Container(
              
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                     color:
                         const Color.fromRGBO(50, 50, 93, 0.25).withOpacity(0.1),
                    // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: const Offset(0, 8), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children :[ 
                    Icon(Icons.manage_accounts,size: 38,),
                    Text(
                "ACCOUNT",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_forward_ios),
              ],
              ), 
            ),
          ),
          SizedBox(height: 13,),
          InkWell(
            onTap: () {},
            child: Container(
              
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                     color:
                         const Color.fromRGBO(50, 50, 93, 0.25).withOpacity(0.1),
                    // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: const Offset(0, 8), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[ 
                    Icon(Icons.bar_chart,size: 38,),
                    Text(
                "SALES",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_forward_ios),
              ],
              ), 
            ),
          ),
          ],
          ),

        // ListTile(
        //         leading: Icon(Icons.verified_user_rounded),
        //         title: Text("Accounts"),
        //         //subtitle: const Text('Number'),
        //         trailing: IconButton(
        //         icon: const ,
        //         color: Colors.black,
        //         tooltip: 'Show Snackbar',
        //         onPressed: () {})),
        //   ListTile(
        //         leading: Icon(Icons.bar_chart),
        //         title: Text("Sales"),
        //         //subtitle: const Text('Number'),
        //         trailing: IconButton(
        //         icon: const Icon(Icons.arrow_forward_ios),
        //         color: Colors.black,
        //         tooltip: 'Show Snackbar',
        //         onPressed: () {})),
      
    );      
      
    
  }
}
  
/*
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Moree extends StatelessWidget {
  const Moree({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(

          appBar: AppBar(
            title: Container(
              //alignment: Alignment.topLeft,
              width: double.infinity,
              height: 40,
              color: Colors.white,
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for something',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'All Clients',
                ),
                Tab(
                  text: 'Team',
                ),
                Tab(
                  text: 'Groups',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text('Chats Page'),
              ),
              Center(
                child: Text('Status Page'),
              ),
              Center(
                child: Text('Calls Page'),
              ),
              
            ],
          ),
        ));
  }

}
*/