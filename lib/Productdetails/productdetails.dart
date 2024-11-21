import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productlist/component/AppText.dart';
import 'package:productlist/component/reviws&fullfeature.dart';

class Productdetails extends StatelessWidget {
  Productdetails(
      {super.key,
      this.description,
      this.price,
      this.name,
      this.imageurl,
      this.imageurl2,
      this.imageurl3});

  final String? name;
  final String? price;
  final String? description;
  final String? imageurl;
  final String? imageurl2;
  final String? imageurl3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          Positioned(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade100,
            ),
          )),
          Positioned(
              child: Container(
            height: 710,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
          )),
          Positioned(
              left: 10,
              top: 30,
              child: Row(
                children: [
                  Card(
                    color: Colors.white,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.back)),
                  ),
                  const SizedBox(
                    width: 250,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.heart),
                    iconSize: 30,
                  )
                ],
              )),
          const Positioned(
              top: 90,
              left: 50,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.red,
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
              )),
          Positioned(
            top: 150,
            left: 320,
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                ),
              ],
            ),
          ),
           Positioned(
              top: 350,
              left: 30,
              child: AppText(
                  txt: '\$$price',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue)),
           Positioned(
              top: 430,
              left: 30,
              child: AppText(
                  txt: '$name',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black)),
          const Positioned(
              top: 460,
              left: 30,
              child: AppText(
                  txt: 'About the item',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey)),
           Positioned(top: 500, left: 30, child: Featurecontainer(description:description ,)),
          Positioned(
              top: 740,
              left: 20,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.cart,
                          color: Colors.white,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: AppText(
                            txt: 'ADD TO CART',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white))
                  ],
                ),
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              )),
        ],
      ),
    );
  }
}
