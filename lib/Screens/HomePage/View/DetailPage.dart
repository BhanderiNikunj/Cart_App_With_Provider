import 'package:cart_app_with_provider/Screens/HomePage/Model/ModelClass.dart';
import 'package:cart_app_with_provider/Screens/HomePage/Provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  HomeProvider? homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    Model m1 = ModalRoute.of(context)!.settings.arguments as Model;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: 500,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${m1.image}",
                  style: TextStyle(color: Colors.black, fontSize: 50),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${m1.name}",
                  style: TextStyle(color: Colors.black, fontSize: 50),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${m1.price}",
                  style: TextStyle(color: Colors.black, fontSize: 50),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    homeProvider!.AddCart(m1);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: Text("Add To Cart"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
