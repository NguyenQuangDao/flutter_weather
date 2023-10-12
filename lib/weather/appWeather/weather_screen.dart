// import 'dart:convert';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_project/database.dart';
// import 'package:flutter_project/pages/Hourly_forecast_item.dart';
// import 'package:flutter_project/screens/openWeather_APIKey.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'pages/additional_infomation.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

// class WeatherScreen extends StatefulWidget {
//   const WeatherScreen({super.key});

//   @override
//   State<WeatherScreen> createState() => _WeatherScreenState();
// }

// class _WeatherScreenState extends State<WeatherScreen> {
//   Future getCurrentWeather() async {
//     try {
//       String cityName = 'hanoi';
//       final res = await http.get(
//         Uri.parse(
//             'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey'),
//       );
//       final data = jsonDecode(res.body);
//       if (data['cod'] != '200') {
//         throw 'an expected error occurred';
//       }
//       return data;
//     } catch (e) {
//       throw e.toString();
//     }
//   }

//   final TextEditingController textControler = TextEditingController();
//   upLoadData() async {
//     Map<String, dynamic> uploaddata = {"Text": textControler.text};
//     await DataBaseMethods().addUserDetails(uploaddata);
//     Fluttertoast.showToast(
//         msg: "uploaded data successfully",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }

//   final TextEditingController srearchControler = TextEditingController();
//   List<String> listDocIDs = [];
//   getIDdata() async {
//     DataBaseMethods databaseMethods = DataBaseMethods();
//     await databaseMethods.searchUserDetails();
//     List<String> docIDs = databaseMethods.docIDs;
//     listDocIDs.addAll(docIDs);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black12,
//       appBar: AppBar(
//         backgroundColor: Colors.black12,
//         title: InkWell(
//           onTap: () {
//             print('tap weather app');
//           },
//           child: const Text(
//             'Weather App',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15),
//             child: IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.refresh),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: FutureBuilder(
//             future: getCurrentWeather(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator.adaptive(),
//                 );
//               }
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text(snapshot.error.toString()),
//                 );
//               }

//               final data = snapshot.data;
//               final listWeatherData = data['list'][0];
//               // temperature F to temperature C
//               double temperatureK = listWeatherData['main']['temp'];
//               double temp = temperatureK - 273.15;
//               String temperatureC = temp.toStringAsFixed(2);
//               //Text sky Weather
//               String currentSky = listWeatherData['weather'][0]['main'];
//               // humidity Weather
//               final humidityWeather = listWeatherData['main']['humidity'];
//               // wind speed
//               final windSpeed = listWeatherData['wind']['speed'];
//               // Pressure Weather
//               final pressureWeather = listWeatherData['main']['pressure'];
//               return Padding(
//                 padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: double.infinity,
//                         child: Card(
//                           shape: const RoundedRectangleBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(12))),
//                           color: Colors.black38,
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 18, bottom: 18),
//                             child: Column(children: [
//                               Text(
//                                 '$temperatureC°C',
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 36,
//                                     color: Colors.white),
//                               ),
//                               const SizedBox(
//                                 height: 12,
//                               ),
//                               const Icon(
//                                 Icons.cloud,
//                                 color: Colors.white,
//                                 size: 52,
//                               ),
//                               const SizedBox(
//                                 height: 12,
//                               ),
//                               Text(
//                                 currentSky,
//                                 style: const TextStyle(
//                                     color: Colors.white, fontSize: 20),
//                               ),
//                             ]),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 18,
//                       ),
//                       const Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Weather Forecast',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.start,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 14,
//                       ),
//                       SizedBox(
//                         height: 130,
//                         child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 10,
//                             itemBuilder: (context, index) {
//                               final hourlyForecast = data['list'][index + 1];
//                               final seconds = hourlyForecast['dt'];
//                               DateTime dateTime =
//                                   DateTime.fromMillisecondsSinceEpoch(
//                                       seconds * 1000);
//                               final timeHour =
//                                   DateTime.parse(hourlyForecast['dt_txt']);
//                               final day = dateTime.day.toString();
//                               final month = dateTime.month.toString();
//                               final year = dateTime.year.toString();
//                               final time = DateFormat.j().format(timeHour);
//                               return HourlyForecastItem(
//                                 time: '${'    '}$time \n $day/$month/$year',
//                                 icon: Icons.nights_stay,
//                                 temperature: hourlyForecast['weather'][0]
//                                     ['main'],
//                               );
//                             }),
//                       ),
//                       const SizedBox(
//                         height: 18,
//                       ),
//                       const Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Additional Infomation',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.start,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 14,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           AdditonalInfomation(
//                             icon: Icons.water_drop,
//                             lable: 'Humidity',
//                             value: humidityWeather.toString(),
//                           ),
//                           AdditonalInfomation(
//                             icon: Icons.air,
//                             lable: 'Wind speed',
//                             value: windSpeed.toString(),
//                           ),
//                           AdditonalInfomation(
//                             icon: Icons.beach_access,
//                             lable: 'Pressure',
//                             value: pressureWeather.toString(),
//                           )
//                         ],
//                       ),
//                       TextField(
//                         style: const TextStyle(color: Colors.white),
//                         keyboardType: TextInputType.text,
//                         controller: textControler,
//                         decoration: const InputDecoration(
//                           fillColor: Colors.white,
//                         ),
//                       ),
//                       Center(
//                         child: TextButton(
//                           onPressed: () {
//                             upLoadData();
//                           },
//                           style: const ButtonStyle(
//                               backgroundColor:
//                                   MaterialStatePropertyAll(Colors.brown),
//                               textStyle: MaterialStatePropertyAll(
//                                   TextStyle(color: Colors.white))),
//                           child: const Text('Upload'),
//                         ),
//                       ),
//                       TextField(
//                         style: const TextStyle(color: Colors.white),
//                         keyboardType: TextInputType.text,
//                         controller: srearchControler,
//                         decoration: const InputDecoration(
//                           fillColor: Colors.white,
//                         ),
//                       ),
//                       Center(
//                         child: TextButton(
//                           onPressed: () {
//                             // getIDdata();
//                           },
//                           style: const ButtonStyle(
//                               backgroundColor:
//                                   MaterialStatePropertyAll(Colors.brown),
//                               textStyle: MaterialStatePropertyAll(
//                                   TextStyle(color: Colors.white))),
//                           child: const Text('Search'),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 500,
//                         child: FutureBuilder(
//                             future: getIDdata(),
//                             builder: (context, snapshot) {
//                               return ListView.builder(
//                                   itemCount: listDocIDs.length,
//                                   itemBuilder: ((context, index) {
//                                     if (snapshot.connectionState ==
//                                         ConnectionState.done) {
//                                       return ListTile(
//                                         title: GetUserDetails(
//                                           documentId: listDocIDs[index],
//                                         ),
//                                       );
//                                     } else {
//                                       return const CircularProgressIndicator();
//                                     }
//                                   }));
//                             }),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }
