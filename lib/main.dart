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
          
           accentColor: Color (0xFF26734d),
          primaryColor: Color (0xFF26734d),
          fontFamily: 'Poppins',
          
         
        ),
        title: 'To Do List',
        home: Homepage(),
      ),
    );
  }
}
