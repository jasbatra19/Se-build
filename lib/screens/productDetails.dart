import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  int index;
  String image;
  String desc;
  String title;
  String price;
  ProductDetails({ Key? key,required this.index,required this.image,required this.desc,required this.title,required this.price}) : super(key: key);
  
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: Colors.black12,
      appBar: AppBar(title: Text("BUILD"),
      backgroundColor: Color(0xFF191A35),),
      body:ListView(children: [
        Container(
          margin: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height*0.4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.contain),
            
          ),
         
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Text(widget.title,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)),
           Container(
               width: MediaQuery.of(context).size.width,
          color: Colors.white,
          margin: EdgeInsets.only(top:20),
          child: Text("PRICE ₹${widget.price}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,)),
          
        GestureDetector(
          onTap: (){
            const snackbar=SnackBar(content: Text('Added to cart successfully'),);
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
            
          },
          child: Container(
            height: 50,
            margin: EdgeInsets.only(top: 30,bottom: 10),
            color: Colors.amber,
            child: Text("ADD TO CART",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top:20),
          child: Text("DESCRIPTION",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800,color: Colors.white))),
        Text(widget.desc,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),

      ]),
    );
  }
}