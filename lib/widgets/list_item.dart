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
   

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        
        
        child: GestureDetector(
         
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color:Color(0xFF26734d)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                  boxShadow: [new BoxShadow(
              color: Color(0xFF26734d),
              blurRadius: 8.0,
            ),]
            ),
            height: 65,
            child: Card(
              elevation: 10,
              child: SingleChildScrollView(
                scrollDirection:Axis.horizontal ,
                            child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ItemText(
                       
                        widget.task.description,
                       
                      ),
                    ),
                   
                    SizedBox(width:60),
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
        ),
      ),
    );
  }
}
