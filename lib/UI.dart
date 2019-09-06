import 'package:flutter/material.dart';
import 'homepage.dart';

UI(){
  return MaterialApp(
     title: 'Todo app',
      theme: ThemeData(
     
        primarySwatch: Colors.amber,
      ),
      home: HomePage(title: 'Todo App Home'),
  );
}

