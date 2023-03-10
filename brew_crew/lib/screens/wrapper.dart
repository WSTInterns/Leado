import 'package:brew_crew/screens/home/homescreen.dart';
import 'package:provider/provider.dart';
import '../screens/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/models/firebaseuser.dart';
import 'authenticate/handler.dart';

class Wrapper extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    
    final user =  Provider.of<FirebaseUser?>(context);
    
     if(user == null)
     {
       return Handler();
     }else
     {
       return HomeBar();
     }

  }
} 