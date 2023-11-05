import 'package:flutter/material.dart';

// class Test extends StatefulWidget {
//   const Test({super.key});

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> with TickerProviderStateMixin {
//   late TabController _controller;
//   var _selecInitialValue = 0;
//   @override
//   void initState() {
//     _controller = TabController(length: 4, vsync: this, initialIndex: 0);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('App bar'),
//         actions: [
//           PopupMenuButton(
//             initialValue: _selecInitialValue,
//             itemBuilder: (context) {
//               return [
//                 const PopupMenuItem(value: 0, child: Text('item 1')),
//                 const PopupMenuItem(value: 1, child: Text('item 2')),
//                 const PopupMenuItem(value: 2, child: Text('item 3')),
//                 const PopupMenuItem(value: 3, child: Text('item 4')),
//               ];
//             },
//             onSelected: (value) {
//               setState(() {
//                 _selecInitialValue = value;
//               });
//             },
//           )
//         ],
//         bottom: TabBar(
//           controller: _controller,
//           tabs: const [
//             Tab(
//               text: 'Cloud',
//               icon: Icon(Icons.cloud),
//             ),
//             Tab(
//               text: 'Terrain',
//               icon: Icon(Icons.terrain),
//             ),
//             Tab(
//               text: 'Wave',
//               icon: Icon(Icons.waving_hand),
//             ),
//             Tab(
//               text: 'Sun',
//               icon: Icon(Icons.sunny),
//             ),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _controller,
//         children: [
//           const Center(child: Text('tab1')),
//           const Center(child: Text('tab2')),
//           const Center(child: Text('tab3')),
//           const Center(child: Text('tab4')),
//         ],
//       ),
//       drawer: Drawer(
//         width: MediaQuery.of(context).size.width * 0.75,
//         child: Container(
//           color: Colors.blue,
//           padding: const EdgeInsets.all(10),
//           child: ListView(
//             children: [
//               Text('data'),
//               Text('data1'),
//               Text('data2'),
//               Text('data3'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Test1 extends StatefulWidget {
//   const Test1({super.key});

//   @override
//   State<Test1> createState() => _Test1State();
// }

// class _Test1State extends State<Test1> with TickerProviderStateMixin {
//   late int _selectedValue = 0;
//   late bool _selectedBoxValue = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Radio Buttons Flutters'),
//       ),
//       body: ListView(
//         children: [
//           ListTile(
//             title: const Text('Flutter'),
//             leading: Radio(
//               value: 0,
//               groupValue: _selectedValue,
//               onChanged: (radio) {
//                 setState(() {
//                   _selectedValue = radio!;
//                 });
//               },
//             ),
//           ),
//           ListTile(
//             title: const Text('ReactJs'),
//             leading: Radio(
//               value: 1,
//               groupValue: _selectedValue,
//               onChanged: (radio) {
//                 setState(() {
//                   _selectedValue = radio!;
//                 });
//               },
//             ),
//           ),
//           ListTile(
//             title: const Text('Java'),
//             leading: Checkbox(
//               value: _selectedBoxValue,
//               onChanged: (box) {
//                 setState(() {
//                   _selectedBoxValue = box!;
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test1State();
}

class _Test1State extends State<Test2> {
  List<String> listItems = ['item 1', 'item 2', 'item 3'];
  String? dropValueMenuButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test Flutters'),
        ),
        body: Center(
          child: SizedBox(
            width: 200,
            child: ListTile(
              trailing: DropdownButton(
                value: dropValueMenuButton,
                onChanged: (value) {
                  setState(() {
                    dropValueMenuButton = value;
                  });
                },
                items: listItems.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              title: const Text('DropdownButton'),
            ),
          ),
        ));
  }
}
