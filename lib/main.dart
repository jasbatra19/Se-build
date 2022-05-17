
import 'package:build/screens/addProducts.dart';
import 'package:build/screens/categoryPage.dart';
import 'package:build/screens/homePage.dart';
import 'package:build/screens/loginPage.dart';
import 'package:build/screens/profile.dart';
import 'package:build/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    
    debugShowCheckedModeBanner: false,
    home:Login()));
}