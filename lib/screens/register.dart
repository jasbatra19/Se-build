import 'package:build/screens/homePage.dart';
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
 final _formKey=GlobalKey<FormState>();

  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  // final phone = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();


  //firebase
  final _auth=FirebaseAuth.instance;


  Widget build(BuildContext context) {
    final firstNameField= TextFormField(
       autofocus: false,
        controller: firstNameEditingController,
               validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
         textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "First Name",
                  prefixIcon: Icon(Icons.person,
              )));

    final secondNameField=TextFormField(
               autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Second Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  hintText: "Last Name",
                  prefixIcon: Icon(Icons.person)),
            );

    final emailField=TextFormField(
             autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  hintText: "Email", prefixIcon: Icon(Icons.email_rounded)),
            );

    // final phoneField=TextFormField(
             
    //           keyboardType: TextInputType.phone,
    //           decoration: InputDecoration(
    //               labelText: "Phone Number",
    //               prefixIcon: Icon(Icons.email_rounded)),
    //         ),
    final passwordField=TextFormField(
              autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.password_rounded)),
            );
    final checkPasswordField=TextFormField(
             autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  hintText: "Confirm Password",
                  prefixIcon: Icon(Icons.password_rounded)),
            );

    return Scaffold(
      backgroundColor: Color(0xFF191A35),
      body: Form(
        key: _formKey,
        child: ListView(
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
              child:firstNameField,
            ),
            Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: secondNameField,
            ),
            Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: emailField
            ),
            // Container(
            //   height: 60,
            //   margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
            //   child: phoneField,
            // ),
            Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: passwordField
            ),
            Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(20, 5, 20, 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: checkPasswordField
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
                signUp(emailEditingController.text, passwordEditingController.text);
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
                      style: TextStyle(fontSize: 20),
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
                GestureDetector(
                  onTap: (){
                    
                  },
                  child: Container(
                    height: 70,
                    width: 300,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(5),
                    child: Image.asset('assets/google.png'),
                    // child: CircleAvatar(
                    //   radius: 25,
                    //   backgroundImage: AssetImage('assets/google.png'),
                    // ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.all(10),
                //   padding: EdgeInsets.all(5),
                //   child: CircleAvatar(
                //     radius: 25,
                //     backgroundImage: AssetImage('assets/apple.jpg'),
                //   ),
                // ),
              ],
            ),
            GestureDetector(
              onTap: () {
                 Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => Login()),
          (route) => false);
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
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          // Fluttertoast.showToast(msg: e!.message);
          print(e!.message);
        });
      } on FirebaseAuthException catch (error) {
        // switch (error.code) {
        //   case "invalid-email":
        //     errorMessage = "Your email address appears to be malformed.";
        //     break;
        //   case "wrong-password":
        //     errorMessage = "Your password is wrong.";
        //     break;
        //   case "user-not-found":
        //     errorMessage = "User with this email doesn't exist.";
        //     break;
        //   case "user-disabled":
        //     errorMessage = "User with this email has been disabled.";
        //     break;
        //   case "too-many-requests":
        //     errorMessage = "Too many requests";
        //     break;
        //   case "operation-not-allowed":
        //     errorMessage = "Signing in with Email and Password is not enabled.";
        //     break;
        //   default:
        //     errorMessage = "An undefined Error happened.";
        // }
        // Fluttertoast.showToast(msg: errorMessage!);
        print(error);
      }
    }
  }
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fname = firstNameEditingController.text;
    userModel.lname = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    // Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => false);
  }

}
