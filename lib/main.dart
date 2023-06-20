import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_application/view/callender.dart';
import 'package:ui_application/controller/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily expenses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MultiProvider(
      providers: [
        ChangeNotifierProvider<MyClass>( create: (context) => MyClass(), ),
        ChangeNotifierProvider(  
      create: (context) => MyClass1(),)],
        child: HomePage(),
      ),
    );
  }
}