import 'package:flutter/material.dart';
import 'package:flutter_project/component/search/search.dart';
import 'package:flutter_project/global_variables.dart';
import 'package:flutter_project/product.dart';

class MyhomePage extends StatefulWidget {
  MyhomePage({super.key});

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  final List<String> filters = [
    'All',
    'Adidas',
    'Nike',
    'Bata',
    'Convert',
    'Dincox'
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                NameShop(),
                Search(),
              ],
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filters[index];
                        });
                      },
                      child: Chip(
                        label: Text(
                          filters[index],
                        ),
                        backgroundColor: selectedFilter == filters[index]
                            ? Color.fromARGB(255, 218, 241, 150)
                            : const Color.fromARGB(255, 239, 243, 247),
                        labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: selectedFilter == filters[index]
                                ? Colors.black
                                : Colors.grey),
                        labelPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    imageURL: product['imageURL'] as String,
                    // company: product['company'] as String,
                    // size: product['size'] as List,
                    backgroudcolor: index.isEven
                        ? const Color.fromRGBO(216, 240, 253, 1)
                        : const Color.fromRGBO(245, 247, 249, 1),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NameShop extends StatelessWidget {
  const NameShop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Text(
            'Shoes\nCollection',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
      ],
    );
  }
}
