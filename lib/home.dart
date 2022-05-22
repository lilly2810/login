import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child:
        Text("Sign In Successful",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black45,fontSize: 40,),),
      )
    );
  }
}
