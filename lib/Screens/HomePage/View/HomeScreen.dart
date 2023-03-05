import 'package:cart_app_with_provider/Screens/HomePage/Model/ModelClass.dart';
import 'package:cart_app_with_provider/Screens/HomePage/Provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeProvider? homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CartApp"),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'cart');
              },
              icon: Icon(Icons.add_shopping_cart),
            )
          ],
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Model m1 = Model(
                      name: homeProvider!.CartList[index].name,
                      image: homeProvider!.CartList[index].image,
                      quntity: homeProvider!.CartList[index].quntity,
                      price: homeProvider!.CartList[index].price);
                  Navigator.pushNamed(context, 'detail', arguments: m1);
                },
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${homeProvider!.CartList[index].image}",
                        style: TextStyle(color: Colors.black, fontSize: 50),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${homeProvider!.CartList[index].name}",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      Text(
                        "${homeProvider!.CartList[index].price}\$",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: homeProvider!.CartList.length,
        ),
      ),
    );
  }
}
