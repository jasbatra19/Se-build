import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191A35),
      appBar: AppBar(
        leading: BackButton(color: Colors.black,
        onPressed: (){
          
        }
        ,),
          title: Text(
            'Settings',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0),
          ),
          // centerTitle: true,
          backgroundColor: Color(0xFFFFA51D),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFDCDCE3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Text('My Account',textAlign: TextAlign.center,style: TextStyle(fontSize: 22),),
              ),
            ),
            SizedBox(width: 5,height: 5,),
            Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFDCDCE3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text('Orders',textAlign: TextAlign.center,style: TextStyle(fontSize: 22),),
              ),
            ),
            SizedBox(width: 5,height: 5,),
            Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFDCDCE3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text('Shop by Category',textAlign: TextAlign.center,style: TextStyle(fontSize: 22),),
              ),
            ),
            SizedBox(width: 5,height: 5,),
            Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFDCDCE3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text('Notifications',textAlign: TextAlign.center,style: TextStyle(fontSize: 22),),
              ),
            ),
            SizedBox(width: 5,height: 5,),
            Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFDCDCE3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text('Settings',textAlign: TextAlign.center,style: TextStyle(fontSize: 22),),
              ),
            ),
            SizedBox(width: 5,height: 5,),
            Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFDCDCE3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text('Login/SignUp',textAlign: TextAlign.center,style: TextStyle(fontSize: 22),),
              ),
            ),
            SizedBox(width: 5,height: 5,),
            Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFDCDCE3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text('Feedback',textAlign: TextAlign.center,style: TextStyle(fontSize: 22),),
              ),
            ),
            SizedBox(width: 5,height: 5,),
            Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFDCDCE3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text('Sign Out',textAlign: TextAlign.center,style: TextStyle(fontSize: 22),),
              ),
            ),
            SizedBox(width: 5,height: 5,),
            Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFDCDCE3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text('Help(FAQs)',textAlign: TextAlign.center,style: TextStyle(fontSize: 22),),
              ),
            ),
            SizedBox(width: 5,height: 5,),
            Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFDCDCE3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text('About',textAlign: TextAlign.center,style: TextStyle(fontSize: 22),),
              ),
            ),
          ]
          ),
    );
  }
}