import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task.dart';
import './list_item.dart';

//Parent widget of all ListItems, this widget role is just to group all list tiles.

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
                      padding: const EdgeInsets.only(left:40),
                      child: Container(
                        height: constraints.maxHeight * 0.4,
                        child: Image.asset('assets/images/waiting1.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'No tasks added yet...',
                      style: TextStyle(fontSize:20,color:Colors.blueGrey,fontFamily:'Popines',fontWeight:FontWeight.bold)
                    ),
                  ],
                ),
              );
            },
          );
  }
}
