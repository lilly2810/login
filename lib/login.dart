import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'home.dart';
import 'log.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String correctPassword = '123456';
  String correctEmail = '123456@gmail.com';
  String animationType = 'idle';
  String message = "";
  bool obscurePassword = true;

  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  final passwordFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();

  @override
  void initState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        setState(() {
          message = "";
          animationType = 'hands_up';
        });
      } else {
        setState(() {
          message = "";
          animationType = 'hands_down';
        });
      }
    });

    usernameFocusNode.addListener(() {
      if (usernameFocusNode.hasFocus) {
        setState(() {
          message = "";
          animationType = 'hands_down';
          animationType = 'test';
        });
      } else {
        setState(() {
          message = "";
          animationType = 'hands_down';
          animationType = 'idle';
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: 300,
            child: FlareActor(
              'assets/Teddy.flr',
              alignment: Alignment.bottomCenter,
              fit: BoxFit.contain,
              animation: animationType,
              callback: (animation) {
                setState(() {
                  animationType = 'hands_down';
                  animationType = 'idle';
                });
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                TextFormField(

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Username",
                    contentPadding: EdgeInsets.all(20),
                    prefixIcon: Icon(Icons.mail_sharp),
                  ),
                  focusNode: usernameFocusNode,
                  controller: usernameController,
                ),
                Divider(),
                TextFormField(
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    prefixIcon: Icon(Icons.vpn_key),
                    suffixIcon: IconButton(
                      onPressed: () =>
                          setState(() {
                            obscurePassword = !obscurePassword;
                          }),
                      icon: Icon(
                          obscurePassword ? Icons.visibility : Icons
                              .visibility_off
                      ),
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                ),
                Divider(),

                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 40),
                    maximumSize: const Size(300, 40),
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => signIn(),
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          Column(
            children: [
              Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child:
                  Column(
                    children: [
                      Text("\n\t\tSign In With\n", style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,),),
                      LoginOption(),
                    ],
                  )

              ),
              SizedBox(
                height: 140,
                width: 300,
              ),
              Container(
                height: 50,
                color: Colors.lightBlue,
                child:
                Text(message, style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),),
              )

            ],
          )
        ],
      ),

    );
  }

  void signIn()async {
    if (animationType == 'hands_up') {
      setState(() {
        animationType = 'hands_down';
      });
    }

    if (passwordController.text.compareTo(correctPassword) == 0 &&
        usernameController.text.compareTo(correctEmail)==0) {
      setState(() {
        animationType = 'hands_down';
        animationType = "success";
        message = "";
      });
       await Future.delayed(Duration(milliseconds: 1800));
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()),);
    } else {
      setState(() {
        message = " Your email or password is incorrect ";
        animationType = 'hands_down';
        animationType = "fail";
      });

    }
  }
}