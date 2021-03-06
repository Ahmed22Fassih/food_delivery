import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget{

  @override
  Widget build(BuildContext context ) {
    return Card(

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0 , vertical: 20),
        child: Row(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // counter of meals
            Container(
              height: 75.0,
              width: 45.0,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0 , color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  InkWell(
                      onTap: () {},
                      child: Icon(Icons.keyboard_arrow_up,
                          color: Color(0xFFD3D3D3))),
                  Text(
                    "0",
                    style: TextStyle(fontSize: 18.0, color: Colors.grey),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Icon(Icons.keyboard_arrow_down,
                          color: Color(0xFFD3D3D3))),

                ],
              ),
            ),
            SizedBox(width:20.0),
            // image in card
            Container(
              height:  70.0,
              width: 70.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/lunch.jpeg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                    offset: Offset(0.0,5.0)
                  )
                ]
              ),
            ),
            SizedBox(width:20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Grilled Chicken" , style: TextStyle(fontSize: 16.0 , fontWeight: FontWeight.bold),),
                SizedBox(height: 5.0,),
                Text("\u023b 3.0", style: TextStyle(color: Colors.orangeAccent , fontSize: 16.0),),
                Container(
                  height: 25.0,
                  width: 120.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text("Chicken",style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold),),
                            SizedBox(width: 5.0,),
                            InkWell(
                                onTap: (){},
                                child: Text("x", style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold),)),
                            SizedBox(width: 5.0,)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text("Chicken",style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold),),
                            SizedBox(width: 5.0,),
                            InkWell(
                                onTap: (){},
                                child: Text("x", style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold),)),
                            SizedBox(width: 5.0,)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text("Chicken",style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold),),
                            SizedBox(width: 5.0,),
                            InkWell(
                                onTap: (){},
                                child: Text("x", style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold),)),
                            SizedBox(width: 5.0,)
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text("Chicken",style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold),),
                            SizedBox(width: 5.0,),
                            InkWell(
                                onTap: (){},
                                child: Text("x", style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold),)),
                            SizedBox(width: 5.0,)
                          ],
                        ),
                      ),



                    ],
                  ),
                )
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: (){},
              child: Icon(Icons.cancel , color: Colors.grey ,),
            ),
          ]
        ),
      ),
    );
  }

}