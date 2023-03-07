import 'package:cart_app_with_provider/Screens/HomePage/Model/ModelClass.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  int i = 1;
  List<Model> CartList = [
    Model(image: "🍎", name: "Apple", price: 80, quntity: 1),
    Model(image: "🍇", name: "Greps", price: 110, quntity: 1),
    Model(image: "🍒", name: "Cherry", price: 60, quntity: 1),
    Model(image: "🍓", name: "Strawberry", price: 150, quntity: 1),
    Model(image: "🥭", name: "Mango", price: 300, quntity: 1),
    Model(image: "🍉", name: "Watermelon", price: 20, quntity: 1),
  ];

  List<Model> DetailList = [];

  void AddCart(Model m1) {
    DetailList.add(m1);
    notifyListeners();
  }

  void updateList(Model m1, int index) {
    DetailList[index] = m1;
    notifyListeners();
  }

  void Delete(Model m1, int index) {
    DetailList.removeAt(index);
    notifyListeners();
  }
}
