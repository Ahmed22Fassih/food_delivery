import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/src/pages/signin_page.dart';
import '../widgets/order_card.dart';

class OrderPage extends StatefulWidget{
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              children: <Widget>[
                OrderCard(),
                OrderCard(),
              ],
            ),
          ]
      ),
      bottomNavigationBar: _buildTotalContainer(),
    );
  }

  Widget _buildTotalContainer (){

    return Container(
      height: 200.0,
     padding: EdgeInsets.symmetric(horizontal: 10.0),
     child: Column(
       children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Text("TotalCard" , style: TextStyle(fontSize: 16.0 , fontWeight: FontWeight.bold),),
             Text("23.0", style: TextStyle(fontSize:  16.0 , fontWeight:  FontWeight.bold),)
           ],
         ),
         SizedBox(height: 10.0,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Text("Discount Card" , style: TextStyle(fontSize: 16.0 , fontWeight: FontWeight.bold),),
             Text("3.0", style: TextStyle(fontSize:  16.0 , fontWeight:  FontWeight.bold),)
           ],
         ),
         SizedBox(height: 10.0,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Text("Tax" , style: TextStyle(fontSize: 16.0 , fontWeight: FontWeight.bold),),
             Text("0.5", style: TextStyle(fontSize:  16.0 , fontWeight:  FontWeight.bold),)
           ],
         ),
         Divider(height: 40.0 , color: Colors.grey,),

         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Text("Subtotal" , style: TextStyle(fontSize: 16.0 , fontWeight: FontWeight.bold),),
             Text("26.5", style: TextStyle(fontSize:  16.0 , fontWeight:  FontWeight.bold),)
           ],
         ),
         SizedBox(height: 10.0,),
         GestureDetector(
           onTap: (){
             Navigator.of(context).push(MaterialPageRoute(builder:( BuildContext context) => SignInPage()));
           },
           child: Container(
             width: MediaQuery.of(context).size.width,
             height: 50.0,
             decoration: BoxDecoration(
               color: Colors.blue,
               borderRadius: BorderRadius.circular(50.0)
             ),
             child: Center(
               child: Text("Procceed to Chechout",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20.0,
                 color: Colors.white
               ),
               ),
             ),
           ),
         )
       ],
     ),
    );

  }

}


