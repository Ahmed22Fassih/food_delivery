import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import '../models/food_model.dart';
import 'package:http/http.dart' as http;
class FoodModel extends Model{

  List<Food> _foods = [];
  bool _isLoading = false ;

  bool get isLoading{
    return _isLoading ;
  }

  List<Food> get foods{
    return List.from(_foods);
  }

  int get foodLength {
    return _foods.length;
  }

  // take Kind of foods from list
//  List<Food> get foods{
//    return List.from(_foods);
//  }

  // add Foods to Database would catch from Food class
  Future<bool> addFood(Food food) async{
    _isLoading = true ;
    notifyListeners();
   try{
     final Map<String, dynamic> foodData = {
       "title": food.name,
       "description": food.description,
       "category": food.category,
       "price": food.price,
       "discount": food.discount,

     };

     final http.Response response = await http.post("https://food-delivery-8775e.firebaseio.com/foods.json" ,
         body: json.encode(foodData));

     final Map<String , dynamic> responseData = json.decode(response.body);

     Food foodWithID = Food(
       id: responseData["name"],
       name: food.name,
       description: food.description,
       category: food.category,
       price: food.price,
       discount: food.discount,
     );

     _foods.add(foodWithID);

     _isLoading = false;
     notifyListeners();
     // fetchFoods();
     return Future.value(true);

   }catch(e){
     _isLoading = false;
     notifyListeners();
     return Future.value(false);
//     print("Connection error: $e");

   }
  }

  // fetch data food from database
  Future<bool> fetchFoods() async{
   _isLoading = true ;
   notifyListeners();
    try{
     final http.Response response = await http.get("https://food-delivery-8775e.firebaseio.com/foods.json");

     final Map<String , dynamic> fetchedData = json.decode(response.body);
     print(fetchedData);

     final List<Food> foodItems = [] ;

     //  fetch all data and pass in foodItems list
     fetchedData.forEach((String id , dynamic foodData){
       Food foodItem = Food(
         id: id,
         name: foodData["title"],
         description: foodData["description"],
         category: foodData["category"],
         price: double.parse(foodData["price"].toString()),
         discount: double.parse(foodData["discount"].toString()),
       );
       foodItems.add(foodItem);
     });

     _foods = foodItems ;
     _isLoading = false ;
     notifyListeners();
     return Future.value(true);
   }catch(error){
      print("the error: $error");
      _isLoading = false ;
      notifyListeners();
      return Future.value(true);
    }
    /* this code when relate with database with php
         without handel his functions
       */
//      final List<Food> fetchedFoodItems = [];
    // print(fetchedData);
//      fetchedData.forEach((data){
//     //  call each element from database in List of food in app
//        Food food = Food(
//          id: data["id"],
//          category: data["category_id"],
//          price: double.parse(data["price"]),
//          discount: double.parse(data["discount"]),
//          name: data["title"],
//          imagePath: data["image_path"],
//        );
//
//        // to add each item had fetched in list
//        fetchedFoodItems.add(food);
//      });
    // put all data fetched in list display on screen called _foods
//      _foods = fetchedFoodItems ;
  }

  Future<bool> updateFood(Map<String , dynamic> foodData , String foodId) async {
    _isLoading = true ;
    notifyListeners();
    // get the food by id
    Food theFood = getFoodItemById(foodId);
    // get the index of the food
    int foodIndex = _foods.indexOf(theFood);

    try{
      await http.put("https://food-delivery-8775e.firebaseio.com/foods/${foodId}.json" , body: json.encode(foodData) );
       Food updateFoodItem = Food(
         id:foodId,
         name: foodData["title"],
         category: foodData["category"],
         discount: foodData["discount"],
         price:  foodData["price"],
         description: foodData["description"],
       );

       _foods[foodIndex] = updateFoodItem ;

       _isLoading = false ;
       notifyListeners();
       return Future.value(true);
    }catch(error){
      _isLoading = false ;
      notifyListeners();
      return Future.value(false);
    }
  }

  Future<bool> deleteFood(String foodId) async {
    _isLoading = true ;
    notifyListeners();
    try{
      final http.Response response = await http.delete("https://food-delivery-8775e.firebaseio.com/foods/${foodId}.json");

      // delete from list items
      _foods.removeWhere((Food food) => food.id == foodId);


     _isLoading = false ;
     notifyListeners();
     return Future.value(true);
    }catch(error){
      _isLoading = false ;
      notifyListeners();
      return Future.value(false);
    }
  }
  Food getFoodItemById(String foodId ){
    Food food ;
    for(int i =0 ;i < _foods.length ; i++){
      if(_foods[i].id == foodId){
        food = _foods[i];
        break;
      }
    }
    return food ;

  }
}