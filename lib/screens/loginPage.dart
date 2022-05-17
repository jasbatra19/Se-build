import 'package:build/screens/homePage.dart';
import 'package:build/screens/options.dart';
import 'package:build/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  //form key
  final _formKey = GlobalKey<FormState>();
  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

//firebase

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
// email
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      validator: (value){
        if (value!.isEmpty){
           return "please enter ur email";
        }
        //reg expression for email validation
      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
      }
      return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Email", prefixIcon: Icon(Icons.email_rounded)),
    );




// password
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
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
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,

      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Password", prefixIcon: Icon(Icons.password_rounded)),
    );


// app body
    return Scaffold(
      backgroundColor: Color(0xFF191A35),
      body: Form(
        key: _formKey,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 100,
              child: Image.asset("assets/build.jpg"),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
              decoration: BoxDecoration(),
              child: Text(
                "Welcome Back! ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: emailField),
            Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: passwordField),
            Center(
              child: Container(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Color(0xFFFFA51D)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                signIn(emailController.text, passwordController.text);
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
                      "Log In",
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
           
                GestureDetector(
                  onTap: googleSignUp,
                  child: Container(
                    height: 50,
                    width: 200,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(5),
                   decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/google.png')))
                    
                  ),
                ),
               
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Register()));
              },
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Dont Have an Account? Sign Up",
                    style: TextStyle(color: Color(0xFFFFA51D)),
                    textAlign: TextAlign.center,
                  )),
            ),
          ],
        ),
      ),
    );
  }

//login
   void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage())),
                });
      } on FirebaseAuthException catch (error) {
        const snackBar = SnackBar(
  content: Text('error.user not found'),
);
ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print(error);
      }
    }
  }


  // login with google
  Future<void> googleSignUp() async {
    final GoogleSignIn googleSignIn=GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
       
      // Getting users credential
      UserCredential result = await _auth.signInWithCredential(authCredential); 
      User? user = result.user;
      
      if (user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Options()));
      }
  }
 
}
}