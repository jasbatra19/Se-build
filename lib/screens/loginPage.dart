import 'package:build/screens/options.dart';
import 'package:build/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  String email="";
  String password="";




//firebase

final _auth=FirebaseAuth.instance;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191A35),
      body: ListView(
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
            child: TextFormField(
              validator: (val) => val!.isEmpty ? "Enter email" : null,
              onChanged: (val) {
                setState(() => email = val);
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Email", prefixIcon: Icon(Icons.email_rounded)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
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
                  hintText: "Password",
                  prefixIcon: Icon(Icons.password_rounded)),
            ),
          ),
          Center(
            child: Container(
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: Color(0xFFFFA51D )),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              signIn(email, password);
            },
            child: Container(
              height: 45,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.fromLTRB(100, 15, 100, 10),
              decoration: BoxDecoration(
                  color: Color(0xFFFFA51D ), borderRadius: BorderRadius.circular(10)),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Log In",
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
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Text("Dont Have an Account? Sign Up",style: TextStyle(color: Color(0xFFFFA51D )),textAlign: TextAlign.center,)),
          ),
         
          
        ],
      ),
    );
  }


//login
void signIn(String email,String password) async{
  await _auth.signInWithEmailAndPassword(email: email, password: password)
  .then((uid) =>{
    print("success"),
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Options())),
  }
  );
}

}



