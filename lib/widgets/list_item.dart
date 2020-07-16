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
      padding: const EdgeInsets.all(12.0),
      child: Container(
        
        
        child: GestureDetector(
         
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color:Theme.of(context).primaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                  boxShadow: [new BoxShadow(
              color: Theme.of(context).primaryColor,
              blurRadius: 2.0,
            ),]
            ),
            height: 65,
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        //height: 100,
                        child: ItemText(
                  
                        widget.task.description,
                        
                         
                        ),
                      )
                      ,
                    ),
                   
                    //SizedBox(width:160),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit,color: Theme.of(context).primaryColor,),
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
                        icon: Icon(Icons.delete,color: Theme.of(context).primaryColor,),
                        onPressed: () {
                      Provider.of<TaskProvider>(context, listen: false)
                .removeTask(widget.task.id);
                        },
                      ),
                      
                        ],
                      ),
                      

                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}
