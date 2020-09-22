import 'package:flutter/material.dart';
import 'package:fooddelivery/src/scoped_model/main_model.dart';
import 'package:fooddelivery/src/pages/signin_page.dart';
import 'screens/main_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class MyApp extends StatelessWidget{

 final  MainModel mainModel = MainModel();
  @override
  Widget build(BuildContext context) {
    // add model to screen app
    return ScopedModel<MainModel>(
      model:mainModel,
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title:  "Food Delivery App ",
        theme: ThemeData(primaryColor:  Colors.blueAccent),
        routes: {
          "/": (BuildContext context) => SignInPage(),
          "/mainscreen": (BuildContext context) => MainScreen(
            model: mainModel,
          ),
        },
      ),
    );
  }

}