import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddImage extends StatefulWidget {
  String category;
   AddImage({ Key? key ,required this.category}) : super(key: key);

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {

   File? image;
   Future pickImage() async{
     final image=await ImagePicker().pickImage(source: ImageSource.gallery);
     if(image==null) return;
     final _image =File(image.path);
     setState(() {
       this.image=_image;
     });
   }
String URL="";

final _formkey=GlobalKey<FormState>();
final TextEditingController titleController = new TextEditingController();
final TextEditingController descriptionController = new TextEditingController();
final TextEditingController priceController=new TextEditingController();
   
  @override
  Widget build(BuildContext context) {

var firestoredb=FirebaseFirestore.instance.collection('${widget.category}');

   Future uploadImage() async{
    if (image!=null){
      Reference ref=FirebaseStorage.instance.ref().child('${widget.category}').child('${randomAlphaNumeric(9)}.jpeg');
      final UploadTask task=ref.putFile(image!);
      await task.whenComplete(() async{
        try{
        var downloadUrl;
        downloadUrl=await ref.getDownloadURL();
          String url=downloadUrl.toString();
        print('the url is ${url}');
        firestoredb.add({
                    'title':titleController.text,
                    'description':descriptionController.text,
                    'price':priceController.text,
                    'image':url
                  });
              return url;
        // return await ref.getDownloadURL();
        }catch(onError){
          print("error uploading file");
        }
      });
    }
     }



 final titleField = TextFormField(
      autofocus: false,
      controller: titleController,
      validator: (value){
        if (value!.isEmpty){
           return "please enter ur email";
        }
      return null;
      },
      onSaved: (value) {
        titleController.text = value!;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "title", prefixIcon: Icon(Icons.text_format_rounded)),
    );


        final descriptionField = TextFormField(
      autofocus: false,
      controller: descriptionController,
      validator: (value){
        if (value!.isEmpty){
           return "please enter ur descr";
        }
      return null;
      },
      onSaved: (value) {
        descriptionController.text = value!;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Description", prefixIcon: Icon(Icons.text_format_rounded)),
    );

final priceField = TextFormField(
      autofocus: false,
      controller: priceController,
      validator: (value){
        if (value!.isEmpty){
           return "please enter ur price";
        }
      
      return null;
      },
      onSaved: (value) {
        priceController.text = value!;
      },
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "price", prefixIcon: Icon(Icons.monetization_on)),
    );





   return Scaffold(
      backgroundColor: Color(0xFF191A35) ,
      appBar: AppBar(title: Text('Upload'),backgroundColor: Color(0xFF191A35),),
     body: Form(
       key: _formkey,      
       child: ListView(children: [
           GestureDetector(
                onTap: pickImage,
                child:image != null
                              ? Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                     color: Colors.white,borderRadius: BorderRadius.circular(10)),
                ):
                 Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  child: Icon(
                                    Icons.add_a_photo_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                        ),
                    Container(
                height: 60,
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: titleField,
              ),
                Container(
                height: 60,
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: descriptionField,
              ),
                Container(
                height: 60,
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: priceField,
              ),
     
            
            
              GestureDetector(
                onTap: () async {
                  if(titleController.text.isNotEmpty && priceController.text.isNotEmpty && descriptionController.text.isNotEmpty && image!=null){
                      uploadImage();  


                  // firestoredb.add({
                  //   'title':titleController.text,
                  //   'description':descriptionController.text,
                  //   'price':priceController.text,
                  // });
                  }
                  else {
                    print ('field empty');
                  }
                },
                child: Container(
                  color: Colors.amber,
                  height: 100,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(30),
                  child: Text("Upload product",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                ),
              )
                
       ]),
     ),
   );
  }
}