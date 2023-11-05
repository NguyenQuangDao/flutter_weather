import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/product.dart';
import 'package:flutter_project/pages/product_details_page.dart';
import 'package:flutter_project/widgets/search/search.dart';
import '../data/global_variables.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
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
                          ? const Color.fromARGB(255, 218, 241, 150)
                          : const Color.fromARGB(255, 239, 243, 247),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: selectedFilter == filters[index]
                              ? Colors.black
                              : Colors.grey),
                      labelPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
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
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProductDetailsPage(product: product);
                    }));
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as String,
                    imageURL: product['imageURL'] as String,
                    // company: product['company'] as String,
                    // size: product['size'] as List,
                    backgroudcolor: index.isEven
                        ? const Color.fromRGBO(216, 240, 253, 1)
                        : const Color.fromRGBO(245, 247, 249, 1),
                  ),
                );
              },
            ),
          )
        ],
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
