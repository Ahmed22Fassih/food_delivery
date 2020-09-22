import 'package:flutter/material.dart';
import 'package:fooddelivery/src/models/food_model.dart';
import 'package:fooddelivery/src/scoped_model/main_model.dart';
import 'package:fooddelivery/src/widgets/button.dart';
import 'package:fooddelivery/src/widgets/show.dailog.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodItem extends StatefulWidget {
  final Food food ;
  AddFoodItem({this.food});

  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  String title;
  String category;
  String description;
  String price;
  String discount;

  GlobalKey<FormState> _foodItemFormKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
              widget.food != null ? "Update Food Item" : "Add Food Item",
              style: TextStyle(
                  fontSize: 20.0 ,
                  fontWeight: FontWeight.bold ,
                  color: Colors.black)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.close , color: Colors.black38), onPressed: () {
              Navigator.of(context).pop();
          },
          ),
        ),
        key: _scaffoldStateKey,
//        resizeToAvoidBottomPadding: false ,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
//          width: MediaQuery.of(context).size.width,
//          height: MediaQuery.of(context).size.height,
            child: Form(
              key: _foodItemFormKey,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    width: MediaQuery.of(context).size.width,
                    height: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/noimage.png"),
                        )),
                  ),
                  _buildTextFromField("Food Title"),
                  _buildTextFromField("Category"),
                  _buildTextFromField("Description", maxLine: 5),
                  _buildTextFromField("Price"),
                  _buildTextFromField("Discount"),
                  SizedBox(
                    height: 15.0,
                  ),
                  ScopedModelDescendant(
                    builder:
                        (BuildContext context, Widget child, MainModel model) {
                      return GestureDetector(
                        // call the Food class to pass data from admin .
                        onTap: () {
                          onSubmit(model.addFood , model.updateFood );
                          if (model.isLoading) {
                            // show loading process
                            showLoadingIndicator(context, widget.food != null ? "Updating food" : "Adding Item ...");
                          }
                        },
                        child: Button(btnText: widget.food != null ? "Update Food Item" : "Add Food Item"),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit(Function addFood , Function updateFood) async {
    if (_foodItemFormKey.currentState.validate()) {
      _foodItemFormKey.currentState.save();

      if(widget.food != null){
        // To edit food from database
        Map<String , dynamic > updatedFoodItem = {
          "title": title ,
          "category": category,
          "description": description,
          "price": double.parse(price),
          "discount": discount != null ? double.parse(discount) : 0.0,

        };
        final bool response = await updateFood(updatedFoodItem , widget.food.id);
        if(response){
          Navigator.of(context).pop();
          Navigator.of(context).pop(response);
        }else if (!response){
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            duration: Duration(seconds: 2 ),
            backgroundColor: Colors.red,
            content: Text("Failed to update food item .", style: TextStyle(
              color: Colors.white ,
              fontSize: 16.0,
            ),),
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
      }else if(widget.food == null){
        // To add food in database
        final Food food = Food(
          name: title,
          category: category,
          description: description,
          price: double.parse(price),
          discount: double.parse(discount),
        );
        // show the food would added or not
        bool value = await addFood(food);
        if(value){
          // to end the alert dialog
          Navigator.of(context).pop();
          // to show after add item
          SnackBar snackBar = SnackBar(
            content: Text("Food item successfully added."),
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }else if(!value){
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text("Failed to add food item "),
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
      }
    }
  }



  Widget _buildTextFromField(String hint, {int maxLine = 1}) {
    return TextFormField(
      initialValue: widget.food != null && hint == "Food Title" ?
      widget.food.name : widget.food != null && hint == "Description"?
      widget.food.description : widget.food != null && hint == "Category"?
      widget.food.category : widget.food != null && hint == "Price"?
      widget.food.price.toString() : widget.food != null && hint == "Discount"?
      widget.food.discount.toString() :"" ,
      decoration: InputDecoration(hintText: "$hint"),
      maxLines: maxLine,
      keyboardType: hint == "Price" || hint == "Discount"
          ? TextInputType.number
          : TextInputType.text,
      validator: (String value) {
//        var errorMsg ="";
        if (value.isEmpty && hint == "Food Title") {
          return "The Food title is required";
        }

        if (value.isEmpty && hint == "Description") {
          return "The Description is required";
        }

        if (value.isEmpty && hint == "Category") {
          return "The Categoty is required";
        }

        if (value.isEmpty && hint == "Price") {
          return "The Price is required";
        }

        if (value.isEmpty && hint == "Discount") {
          return "The Discount is required";
        }
       return "" ;
      },
      onSaved: (String value) {
        if (hint == "Food Title") {
          title = value;
        }
        if (hint == "Category") {
          category = value;
        }
        if (hint == "Description") {
          description = value;
        }
        if (hint == "Price") {
          price = value;
        }
        if (hint == "Discount") {
          discount = value;
        }
      },
    );
  }

}
