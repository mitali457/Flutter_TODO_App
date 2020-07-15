import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/task.dart';
import './screens/homepage.dart';

void main() => runApp(ToDoListApp());

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
           //primarySwatch:const Color(0x26734d),
          //primaryColor:const Color(0x26734d),
          fontFamily: 'Poppins',
          
         
        ),
        title: 'To Do List',
        home: Homepage(),
      ),
    );
  }
}
