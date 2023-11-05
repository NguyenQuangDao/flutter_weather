import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/firebase/firebase_config.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/textField.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _nameProductController = TextEditingController();
  final TextEditingController _describeProductController =
      TextEditingController();
  final TextEditingController _priceProductController = TextEditingController();
  // Uint8List? _image;
  // void selectImage() async {
  //   Uint8List img = await pickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = img;
  //   });
  // }
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Name Product:',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          TextFieldTemplate(
            hintTextInput: 'Name Product...',
            iconInput: Icons.abc,
            controller: _nameProductController,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Mô tả:',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          TextFieldTemplate(
            hintTextInput: 'Mô tả cho sản phầm...',
            iconInput: Icons.access_alarm,
            controller: _describeProductController,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Giá:',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          TextFieldTemplate(
            hintTextInput: 'nhập giá cần bán...',
            iconInput: Icons.price_change,
            controller: _priceProductController,
          ),
          Expanded(
            child: Center(
              child: _image == null
                  ? const Text('No image selected.')
                  : Image.file(_image!),
            ),
          ),
          const showPicker(),
          ElevatedButton(
            onPressed: () async {
              final image = await pickImage(ImageSource.gallery);
              if (image != null) {
                _image = File(image.path);
              }
              print(_image);
            },
            child: const Text('add photo'),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  try {
                    if (_nameProductController.text.isNotEmpty &&
                        _describeProductController.text.isNotEmpty &&
                        _priceProductController.text.isNotEmpty) {
                      await _createProduct(Product(
                        nameProduct: _nameProductController.text,
                        describeProduct: _describeProductController.text,
                        priceProduct: _priceProductController.text,
                      ));
                      setState(() {
                        _nameProductController.clear();
                        _describeProductController.clear();
                        _priceProductController.clear();
                      });
                      print('create success!!!');
                    } else {
                      print('create no success!!!');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text('Add new product')),
          )
        ],
      ),
    );
  }
}

_createProduct(Product product) async {
  final producCollection = db.collection('product');
  String id = producCollection.doc().id;
  final newProduct = Product(
    id: id,
    sizeProduct: product.sizeProduct,
    nameProduct: product.nameProduct,
    describeProduct: product.describeProduct,
    priceProduct: product.priceProduct,
  );
  final productData = newProduct.createToJson();
  producCollection.doc(id).set(productData);
}

class Product {
  final String? nameProduct;
  final String? describeProduct;
  final String? priceProduct;
  final String? sizeProduct;
  final String? id;
  Product({
    this.nameProduct,
    this.describeProduct,
    this.priceProduct,
    this.id,
    this.sizeProduct,
  });
  Map<String, dynamic> createToJson() {
    return {
      "id": id,
      "size": sizeProduct,
      "nameProduct": nameProduct,
      "describeProduct": describeProduct,
      "priceProduct": priceProduct
    };
  }
}

class showPicker extends StatelessWidget {
  const showPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Wrap(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              ListTile(
                  leading: const Icon(
                    Icons.photo_library,
                  ),
                  title: const Text(
                    'Gallery',
                    style: TextStyle(),
                  ),
                  onTap: () {
                    pickImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(
                  Icons.photo_camera,
                ),
                title: const Text(
                  'Camera',
                  style: TextStyle(),
                ),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

pickImage(ImageSource imageForm) async {
  XFile? file = await ImagePicker().pickImage(source: imageForm);
  if (file == null) {
    return await file?.readAsBytes();
  }
}
