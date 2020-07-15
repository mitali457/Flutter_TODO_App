import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/taskmodel.dart';

import '../providers/task.dart';
import '../widgets/add_new_task.dart';
import './item_text.dart';



class ListItem extends StatefulWidget {
  final Task task;

  ListItem(this.task);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
   

    return Container(
      
      child: GestureDetector(
       
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
          ),
          height: 65,
          child: Card(
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  
                  children: <Widget>[
                    
                    ItemText(
                     
                      widget.task.description,
                     
                    ),
                  ],
                ),
                SizedBox(width:120),
                
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => AddNewTask(
                          id: widget.task.id,
                          isEditMode: true,
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      Provider.of<TaskProvider>(context, listen: false)
            .removeTask(widget.task.id);
                    },
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
