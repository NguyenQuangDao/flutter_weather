import 'package:flutter/material.dart';
import 'package:flutter_project/provider/cartProvider.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.product['title'] as String,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(25),
            child: Image(
              image: AssetImage(widget.product['imageURL'] as String),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          Container(
            height: 250,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(230, 239, 243, 1),
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Center(
                  child: Text(
                    '${widget.product['price']}\$',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(size.toString()),
                            backgroundColor: selectedSize == size
                                ? const Color.fromARGB(255, 218, 241, 150)
                                : null,
                            labelPadding:
                                const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Spacer(),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () {
                        try {
                          if (selectedSize != 0) {
                            Provider.of<CartProvider>(context, listen: false)
                                .addProductToCart({
                              'id': widget.product['id'],
                              'title': widget.product['title'],
                              'price': widget.product['price'],
                              'imageURL': widget.product['imageURL'],
                              'company': widget.product['company'],
                              'sizes': selectedSize,
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      'Add to cart successfully !!',
                                      style: TextStyle(color: Colors.white),
                                    )));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text(
                                  'Please select a size!',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }
                        } catch (error) {
                          throw Exception(error);
                        }
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 218, 241, 150),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Add to card',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
