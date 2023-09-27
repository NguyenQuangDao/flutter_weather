import 'package:flutter/material.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9EBEA),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20),
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Icon(
                            Icons.search,
                            size: 30,
                          )),
                      hintText: 'Search..',
                      hintStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 15),
                child: const Icon(
                  Icons.shopping_bag,
                  size: 36.0,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 35, left: 10),
                child: const Icon(
                  Icons.assessment,
                  size: 36.0,
                ),
              ),
            ],
          ),
          const Image(
            image: AssetImage('assets/images/main.png'),
            height: 220,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Image(
                        image: AssetImage('assets/icons/grid.png'),
                        width: 35,
                        height: 35,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Category',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Image(
                        image: AssetImage('assets/icons/flight-mode.png'),
                        width: 35,
                        height: 35,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Flight',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Image(
                        image: AssetImage('assets/icons/dollar.png'),
                        width: 35,
                        height: 35,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Bill',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Image(
                        image: AssetImage('assets/icons/globe.png'),
                        width: 35,
                        height: 35,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Data Plan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Image(
                        image: AssetImage('assets/icons/coupon.png'),
                        width: 35,
                        height: 35,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Data Plan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Sale Product",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
                Text(
                  "See more",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 10),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 170,
                      height: 140,
                      child: Image(
                        height: MediaQuery.of(context).size.height,
                        image: const AssetImage('assets/images/shirt1.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Shirt ditycoin',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                print('hello');
              },
              child: const Text('click Me!!'))
        ],
      ),
    );
  }
}
