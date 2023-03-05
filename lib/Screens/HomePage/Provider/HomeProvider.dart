import 'package:cart_app_with_provider/Screens/HomePage/Model/ModelClass.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier
{
  int i=1;
  List<Model> CartList = [
    Model(image: "🍎",name: "Apple",price: 100,quntity: 1),
    Model(image: "🍇",name: "Greps",price: 100,quntity: 1),
    Model(image: "🍒",name: "Cherry",price: 100,quntity: 1),
    Model(image: "🍓",name: "Strawberry",price: 100,quntity: 1),
    Model(image: "🥭",name: "Mango",price: 100,quntity: 1),
    Model(image: "🍉",name: "Watermelon",price: 100,quntity: 1),
  ];

  List<Model> DetailList = [];

  void AddCart(Model m1)
  {
    DetailList.add(m1);
    notifyListeners();
  }

  void Add()
  {
    i++;
    notifyListeners();
  }
  void sub()
  {
    i--;
    notifyListeners();
  }

  void Price(int index,Model m11)
  {
    DetailList[index] = m11;
    notifyListeners();
  }
}