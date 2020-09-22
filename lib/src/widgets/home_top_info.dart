import 'package:flutter/material.dart';
class   HomeTopInfo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final textStyle = TextStyle(fontSize:32.0 ,fontWeight: FontWeight.bold);

    return  Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: <Widget>[
              Text("what would " , style: textStyle ),
              Text("to you eat ?", style: textStyle),
            ],
          ),
        ],
      ),
    );
  }
}