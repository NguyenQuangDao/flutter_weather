import 'package:flutter/material.dart';
import 'package:flutter_project/provider/cartProvider.dart';
import 'package:provider/provider.dart';

class ProductCartItems extends StatelessWidget {
  const ProductCartItems({super.key});
  @override
  Widget build(BuildContext context) {
    // final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<CartProvider>(builder: (context, cartPvd, child) {
        return ListView.builder(
          itemCount: cartPvd.cart.length,
          itemBuilder: (context, index) {
            final cartItem = cartPvd.cart[index];
            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(cartItem['imageURL'].toString()),
                  radius: 30,
                ),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actionsPadding: const EdgeInsets.all(20),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              title: const Text(
                                'Delete Product',
                                style: TextStyle(fontSize: 24),
                              ),
                              content: const Text(
                                  'are you sure want to remove the product?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<CartProvider>()
                                        .removeProduct(cartPvd.cart[index]);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                title: Text(
                  cartItem['title'].toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text('Size ${cartItem['size']}'),
              ),
            );
          },
        );
      }),
    );
  }
}
