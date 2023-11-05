import 'package:flutter/material.dart';
import 'package:flutter_project/pages/add_product_page.dart';
import 'package:flutter_project/pages/product_cart_items_page.dart';
import 'package:flutter_project/widgets/product_list.dart';

class MyhomePage extends StatefulWidget {
  const MyhomePage({super.key});

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  int currentPage = 0;
  List<Widget> pages = const [ProductList(), AddProduct(), ProductCartItems()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'add'),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: 'cart'),
        ],
      ),
    );
  }
}
