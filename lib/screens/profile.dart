import 'package:build/screens/homePage.dart';
import 'package:build/screens/options.dart';
import 'package:build/services/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF191A35),
        appBar: AppBar(
          leading: BackButton(
            onPressed: (){
                Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Options()));
              
            },
            color: Colors.black,
          ),
          actions: [IconButton(onPressed: (){
              Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage())
                );

          }, icon:Icon(Icons.home,color: Colors.black,))],
          // centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0),
          ),
          
          backgroundColor: Color(0xFFFFA51D),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: ()async{
                     
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Image(
                          image: AssetImage(
                            'assets/Person.png',
                          ),
                          height: 100,
                          width: 200,
                        ),
                      ),
                    ),
                    Text(
                      'James',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Your Address',
                style: TextStyle(
                  
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 20,
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFDCDCE3),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  //obscureText: true,//if we want to write password and do not want to show it then we have to put this field to true.
                  decoration: InputDecoration(
                    hintText: "Address",
                    labelStyle: TextStyle(color: Colors.black)
                   
                    
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 5, 10),
                  child: Text(
                    'Add Address',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 15,
                ),
              ],
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Login & Security',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Phone Number',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 20,
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFDCDCE3),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  //obscureText: true,//if we want to write password and do not want to show it then we have to put this field to true.
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 20,
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFDCDCE3),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  //obscureText: true,//if we want to write password and do not want to show it then we have to put this field to true.
                  decoration: InputDecoration(
                    hintText: "Email",
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 20,
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  obscureText:
                      true, //if we want to write password and do not want to show it then we have to put this field to true.
                  decoration: InputDecoration(
                    labelText: "Password",
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 5, 10),
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Manage Payment Options',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ));
  }
}
