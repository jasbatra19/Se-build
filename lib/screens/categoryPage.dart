
import 'package:build/categories.dart/bricks.dart';
import 'package:build/categories.dart/cable.dart';
import 'package:build/categories.dart/cement.dart';
import 'package:build/categories.dart/doors.dart';
import 'package:build/categories.dart/sanitary.dart';
import 'package:build/categories.dart/sariya.dart';
import 'package:build/categories.dart/tiles.dart';
import 'package:build/categories.dart/windows.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../categories.dart/paints.dart';

class Category extends StatefulWidget {
  const Category({ Key? key }) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

var firestoredb=FirebaseFirestore.instance.collection('product_category').snapshots();
List<Widget> route = [Sanitary(),Cement(),Tiles(),Cable(),Paints(),Windows(),Sariya(),Bricks(),Doors()];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Category"),
        backgroundColor: Color(0xFF191A35),),
        body:StreamBuilder(
          stream: firestoredb,
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
            if (!snapshot.hasData) {
              CircularProgressIndicator();
            return Text("error");
            
          }
             return ListView.builder(
               itemCount: snapshot.data!.docs.length,
               itemBuilder: (context,int index){
                  return Container(
                    decoration: BoxDecoration(color: Color(0xFF191A35)),
                    child:GestureDetector(
                      onTap: (){
                        final id=index;
                        print(id);
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) => route[id]));
 
                      },
                      child: Stack(
                        children:[ Container(                  
                          width: MediaQuery.of(context).size.width,
                          child:Column(children: [
                             Container(
                               height: MediaQuery.of(context).size.height*0.25,
                           width: MediaQuery.of(context).size.width*0.75,
                               decoration: BoxDecoration(
                                 image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index]['image']),fit: BoxFit.fill)
                               ),
                             ),
                              Container(
                             alignment: Alignment.center,
                             padding: EdgeInsets.all(10),
                             height: 45,
                          
                             color: Colors.black54.withOpacity(1),
                             child: Text(snapshot.data!.docs[index]['title'],style: TextStyle(fontSize: 20,color: Colors.white),))
                           
                             
                          ],),),
                    ],  ),
                    ),
                  );                      
                     
                    
              
               });
           
          },
        )
      ),
    );
  }
}

