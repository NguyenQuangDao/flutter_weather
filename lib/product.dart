import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageURL;
  // final String company;
  // final List size;
  final Color backgroudcolor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageURL,
    required this.backgroudcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
      decoration: BoxDecoration(
        color: backgroudcolor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '\$$price',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Center(
            child: Image(
              image: AssetImage(imageURL),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
