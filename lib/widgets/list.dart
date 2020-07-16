import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task.dart';
import './list_item.dart';



class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final taskList = Provider.of<TaskProvider>(context).itemsList;
    return taskList.length > 0
        ? Padding(
          padding: const EdgeInsets.only(top:120),
          child: ListView.builder(
              itemCount: taskList.length, 
              itemBuilder: (context, index) {
                return ListItem(taskList[index]);
              },
            ),
        )
        : LayoutBuilder(
            builder: (ctx, constraints) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:40,bottom: 20),
                      child: Container(
                        height: constraints.maxHeight * 0.4,
                        child: Image.asset('assets/images/waiting1.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                    
                    Text(
                      'No tasks added yet....',
                      style: TextStyle(fontSize:23,color:Theme.of(context).primaryColor,fontFamily:'Popines',fontWeight:FontWeight.bold)
                    ),
                  ],
                ),
              );
            },
          );
  }
}
