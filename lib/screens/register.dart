import 'package:build/screens/loginPage.dart';
import 'package:build/screens/options.dart';
import 'package:build/services/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  bool isChecked = false;
  String fname = "";
  String lname = "";
  String email = "";
  String phone = "";
  String password = "";
  String newpass = "";


  //firebase
  final _auth=FirebaseAuth.instance;


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191A35),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 90, 0),
                decoration: BoxDecoration(),
                child: Text(
                  "Get Started! ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                child: Image.asset("assets/build.jpg"),
              ),
            ],
          ),
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              validator: (val) => val!.isEmpty ? "Enter first name" : null,
              onChanged: (val) {
                setState(() => fname = val);
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "First Name",
                  prefixIcon: Icon(Icons.email_rounded)),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              validator: (val) => val!.isEmpty ? "Enter last name" : null,
              onChanged: (val) {
                setState(() => lname = val);
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Last Name",
                  prefixIcon: Icon(Icons.email_rounded)),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              validator: (val) => val!.isEmpty ? "Enter email" : null,
              onChanged: (val) {
                setState(() => email = val);
              },
              decoration: InputDecoration(
                  labelText: "Email", prefixIcon: Icon(Icons.email_rounded)),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              onChanged: (val) {
                setState(() => phone = val);
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.email_rounded)),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              validator: (val) =>
                  val!.length < 6 ? "Enter password 6+ char long" : null,
              onChanged: (val) {
                setState(() => password = val);
              },
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.password_rounded)),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(20, 5, 20, 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              validator: (val) =>
                  val != password ? "Password doesnot match" : null,
              onChanged: (val) {
                setState(() => email = val);
              },
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Confirm Password",
                  prefixIcon: Icon(Icons.password_rounded)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 20,
                width: 20,
                color: Colors.white,
                child: Checkbox(
                  checkColor: Colors.black,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  value: isChecked,
                ),
              ),
              Text("Agree to the terms & conditions",
                  style: TextStyle(color: Colors.white))
            ],
          ),
          GestureDetector(
            onTap: () {
              signUp(email, password);
            },
            child: Container(
              height: 45,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.fromLTRB(100, 15, 100, 10),
              decoration: BoxDecoration(
                  color: Color(0xFFFFA51D),
                  borderRadius: BorderRadius.circular(10)),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.3,
                height: 2,
              ),
              Text(
                " OR ",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.3,
                height: 2,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/google.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/apple.jpg'),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Already Have an Account? Sign In",
                  style: TextStyle(color: Color(0xFFFFA51D)),
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    );
  }


  void signUp(String email,String password)async{
    await _auth.createUserWithEmailAndPassword(email: email, password: password)
    .then((value) => {postDetailsToFirestore()})
    .catchError((e){
      print(e);
    });

  }

   postDetailsToFirestore()async{
     //calling firestore
     //calling user model
     //sending these values

     FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
     User? user=_auth.currentUser;

     UserModel userModel=UserModel();

     //writing all vals
     userModel.email=user!.email;
     userModel.uid=user.uid;
     userModel.fname=fname;
     userModel.lname=lname;
  

    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());
     Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => Options()),
        (route) => false);

   }


}
