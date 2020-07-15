import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/customshapeborder.dart';

import '../widgets/add_new_task.dart';
import '../widgets/list.dart';



class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
         shape: CustomShapeBorder(),
        title: Text('TODO_App'),
        centerTitle: true,
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {
          //     showModalBottomSheet(
          //       context: context,
          //       builder: (_) => AddNewTask(isEditMode: false),
          //     );
          //   },
          // ),
        ],
      ),
      body: List(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => AddNewTask(isEditMode: false),
          );
        },
        tooltip: 'Add a new item!',
      ),
    );
  }
}
