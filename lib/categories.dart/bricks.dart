import 'package:build/screens/productDetails.dart';
import 'package:build/services/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Bricks extends StatefulWidget {
  const Bricks({ Key? key }) : super(key: key);


  @override
  State<Bricks> createState() => _BricksState();
}

class _BricksState extends State<Bricks> {

  
var firestoredb=FirebaseFirestore.instance.collection('bricks').snapshots();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Color(0xFF191A35),
      appBar: AppBar(title: Text("Bricks"),
      backgroundColor: Color(0xFF191A35),),
      
      body: StreamBuilder(
          stream: firestoredb,
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
            if (!snapshot.hasData) {
            return Text("error");
            
          }
             return GridView.count(
              //  itemCount: snapshot.data!.docs.length,
              crossAxisCount: 2,
               children: List.generate(snapshot.data!.docs.length,(index){
                  return Container(
                    decoration: BoxDecoration(color: Color(0xFF191A35)),
                    child:GestureDetector(
                      onTap: (){
                        print(index);
                        int i=index;
                        print(snapshot.data!.docs[index]['image']);
                        product(index,snapshot.data!.docs[index]['image'], snapshot.data!.docs[index]['title'], snapshot.data!.docs[index]['description'], snapshot.data!.docs[index]['price']);
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(index: i,image: snapshot.data!.docs[index]['image'],desc: snapshot.data!.docs[index]['description'],title: snapshot.data!.docs[index]['title'],price:snapshot.data!.docs[index]['price']),
                        ),
                      );
                      },
                      child: Container( 
                        color: Colors.blueGrey,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),                 
                        width: MediaQuery.of(context).size.width*0.75,
                        child:Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                           Container(
                             decoration: BoxDecoration(
                               image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index]['image'] ),
                               fit: BoxFit.fill
                             ),
                            ),
                             ),
                           Container(
                             color: Colors.black.withOpacity(0.2),
                           ),
                           Container(
                             alignment: Alignment.center,
                             padding: EdgeInsets.all(10),
                             height: 45,
                             width: 200,
                             color: Colors.black54.withOpacity(1),
                             child: Text(snapshot.data!.docs[index]['title'],style: TextStyle(fontSize: 20,color: Colors.white),))
                           
                        ],),),
                    ),
                  );                      
                     
                    
              
               }));
           
          },
        )
      );
  }

}