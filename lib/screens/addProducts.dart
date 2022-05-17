import 'package:build/screens/addImage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({ Key? key }) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  FirebaseAuth _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFF191A35),
       appBar: AppBar(title: Text("ADDING PRODUCTS"),
     backgroundColor: Color(0xFF191A35),),
      body: ListView(
        children: [
          Text("Please Select a Category",style: TextStyle(color: Colors.white,fontSize: 35),textAlign: TextAlign.center,),
  
        GestureDetector(
          onTap:(){
            
                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddImage(category: 'bricks',),
                        ),
                      );
          },
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(30),
            color: Colors.amber.shade500,
            child: Text("Bricks",style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
            margin: EdgeInsets.fromLTRB(10,30,10,10),
          ),
        ),
        GestureDetector(
          onTap:(){
   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddImage(category: 'cables',),
                        ),
                      );
          },
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(30),
            color: Colors.amber.shade500,
            child: Text("Cables",style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
            margin: EdgeInsets.all(10),
          ),
        ),
        GestureDetector(
          onTap:(){
   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddImage(category: 'cement',),
                        ),
                      );
          },
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(30),
            color: Colors.amber.shade500,
            child: Text("Cement",style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
            margin: EdgeInsets.all(10),
          ),
        ),
        GestureDetector(
          onTap:(){
  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddImage(category: 'door',),
                        ),
                      );
          },
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(30),
            color: Colors.amber.shade500,
            child: Text("Doors",style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
            margin: EdgeInsets.all(10),
          ),
        ),
       
        ],
      ),
    );
  }
}