import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_project/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_project/provider/addProvider.dart';
import 'package:provider/provider.dart';
import 'provider/cartProvider.dart';
import 'firebase/firebase_options.dart';
import 'pages/home_page.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.white),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,

        home: const MyhomePage(),
        // home: const Test2(),
        // home: ProductDetailsPage(product: products[0]),
      ),
    );
  }
}
