import 'package:flutter/material.dart';




class ItemText extends StatelessWidget {
 
  final String text;
  
  ItemText(
    
    this.text,
    
  );

  Widget _buildText(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        
      ],
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return _buildText(context);
    
  }
}
