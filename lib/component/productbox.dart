import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productlist/Productdetails/productdetails.dart';


class ProductBox extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? description;
  final double? price;
  final VoidCallback? onTap;

  const ProductBox({
    super.key,
    this.imageUrl,
    this.name,
    this.description,
    this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:onTap,
      child: Card(color: Colors.white,
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageUrl != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl!,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
                  : const SizedBox(height: 100),

              const SizedBox(height: 2),
              Text(
                name ?? "",
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description ?? "",
                style: const TextStyle(
                  fontSize: 0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price != null ? '\$${price!.toStringAsFixed(2)}' : "",
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.heart,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}