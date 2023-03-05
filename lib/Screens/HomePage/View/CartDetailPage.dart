import 'package:cart_app_with_provider/Screens/HomePage/Model/ModelClass.dart';
import 'package:cart_app_with_provider/Screens/HomePage/Provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  HomeProvider? homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Consumer<HomeProvider>(
          builder: (context, value, child) => ListView.builder(
            itemCount: homeProvider!.DetailList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${homeProvider!.DetailList[index].image}",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                "${homeProvider!.DetailList[index].name}",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "${homeProvider!.DetailList[index].price}",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              homeProvider!.Add();
                              Model m1 = Model(
                                image: homeProvider!.DetailList[index].image,
                                price: homeProvider!.DetailList[index].price! * 2,
                                name: homeProvider!.DetailList[index].name,
                                quntity: homeProvider!.DetailList[index].quntity! + homeProvider!.i,
                              );
                              homeProvider!.Price(index, m1);
                              print(homeProvider!.i);
                            },
                            child: Text(
                              "+",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("${homeProvider!.DetailList[index].quntity}"),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "-",
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
