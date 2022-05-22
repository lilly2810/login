import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: Icon(Icons.arrow_back),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors .blue,
        body: LoginScreen(),

      ),
    );
  }
}
