import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/src/widgets/custom_list_tile.dart';
import 'package:fooddelivery/src/widgets/small_button.dart';

class ProfilePage extends StatefulWidget{
  @override
  _ProfilePageState createState() => _ProfilePageState() ;
}

class _ProfilePageState extends State<ProfilePage>{
  bool turnOnNotification = false ;
  bool turnOnLocation = false ;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
     body: SingleChildScrollView(
       child: Container(
         padding: EdgeInsets.symmetric( horizontal: 20.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Text("profile" , style: TextStyle(
               fontSize: 18.0,
               fontWeight: FontWeight.bold,
             ),),
             SizedBox(height: 20.0),
             Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[
                 Container(
                   height: 120.0,
                   width: 120.0,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(60.0),
                     boxShadow: [
                       BoxShadow(
                         blurRadius: 3.0,
                         offset: Offset(0,4.0),
                         color: Colors.black38,
                     ),
                    ],
                     image: DecorationImage(
                       image: AssetImage("assets/images/breakfast.jpeg"),
                       fit: BoxFit.cover
                     )
                   ),
                 ),
                 SizedBox(width: 60.0),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text("Ahmed Fassih", style: TextStyle(fontSize: 18.0),),
                     SizedBox(height: 10.0),
                     Text("+0201285829001" , style: TextStyle(color: Colors.green),),
                     SizedBox(height:20.0),
                     SmallButton(btnText: "Edit",),
                   ],
                 )
               ],
             ),
             SizedBox(height: 30.0,),
             Text("Account", style: TextStyle(
               fontSize: 20.0,
               fontWeight: FontWeight.bold
             ),
             ),
             SizedBox(height: 5.0,),
             Padding(
               padding: EdgeInsets.symmetric(vertical: 5.0 , horizontal: 10.0),
               child: Card(
                 child: Padding(
                   padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                   child:Column(
                     children: <Widget>[
                       CustomListTile(
                         icon: Icons.location_on,
                         text: "Location",
                       ),
                       Divider(height: 10.0,color: Colors.grey),
                       CustomListTile(
                         icon: Icons.visibility,
                         text: "Change Password",
                       ),
                       Divider(height: 10.0,color: Colors.grey),
                       CustomListTile(
                         icon: Icons.shopping_cart,
                         text: "shopping",
                       ),
                       Divider(height: 10.0,color: Colors.grey),
                       CustomListTile(
                         icon: Icons.payment,
                         text: "Payment",
                       ),
                       Divider(height: 10.0,color: Colors.grey),
////                   ListTile(
////                     leading: Icon(Icons.location_on),
////                     title: Text("Location"),
////                     subtitle: Text("Something"),
////                     trailing: Icon(Icons.location_off),
////
////                   ),
//                   Divider(height: 5.0,color: Colors.grey,endIndent: 10.0,indent: 20.0,),
                     ],
                   )
                 ),
               ),
             ),

             Text("Notifications", style: TextStyle(
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold
             ),
             ),
             SizedBox(height: 5.0,),

             Card(
               elevation: 3.0,
               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.0),
                 child: Column(
                   children: <Widget>[
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Text(
                           "App Notification"
                         ),
                         Switch(
                           value: turnOnNotification,
                           onChanged: (bool value){
                             setState(() {
                               turnOnNotification = value ;
                             });
                           },
                         ),
                       ],
                     ),
                     Divider(height: 5.0,color: Colors.grey),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Text(
                             "Location Tracking"
                         ),
                         Switch(
                           value: turnOnLocation,
                           onChanged: (bool value){
                             setState(() {
                               turnOnLocation = value ;
                             });
                           },
                         ),
                       ],
                     ),
                     Divider(height: 5.0,color: Colors.grey),
                   ],
                 ),
               ),
             ),
             SizedBox(height: 5.0,),
             Text(
               "Other",
               style: TextStyle(
                   fontSize: 20.0,
                   fontWeight: FontWeight.bold
               ),
             ),
             SizedBox(height: 5.0,),
             Card(
               child:Padding(
                 padding: EdgeInsets.all(20.0),
                 child: Container(
                   width: MediaQuery.of(context).size.width,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Text("Language", style: TextStyle(fontSize: 16.0),),

                       Divider(
                         height: 10.0,
                         color: Colors.grey,
                       ),
                       Text("Currency", style: TextStyle(fontSize: 16.0),),

                       Divider(
                         height: 10.0,
                         color: Colors.grey,
                       ),

                     ],
                   ),
                 )
               ),
             )

           ],
         ),
       ),
     ),
    );
  }
}