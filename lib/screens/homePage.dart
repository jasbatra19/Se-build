import 'package:build/screens/addProducts.dart';
import 'package:build/screens/categoryPage.dart';
import 'package:build/screens/options.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191A35),
       appBar: AppBar(title: Text("Home"),
       actions: [IconButton(onPressed: (){
          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Options()));
       }, icon: Icon(Icons.settings))],
        backgroundColor: Color(0xFF191A35),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
  
        GestureDetector(
          onTap: (){
            Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddProducts()));
          },
          child: Container(height: 100,
          width: MediaQuery.of(context).size.width,
          color: Colors.amber,
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.all(20),
          child: Text("Add products",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),
        ),

        GestureDetector(
          onTap: (){
            Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Category()));
          },
          child: Container(height: 100,
          width: MediaQuery.of(context).size.width,
          color: Colors.amber,
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.all(20),
          child: Text("View products",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),
        ),
      ],),
    );
  }
}