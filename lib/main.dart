import 'package:flutter/material.dart';
import 'package:love_calculator/Ui%20kit/ui.dart';

import 'Pages/detailPage.dart';
import 'Pages/mainScreen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MainScreen(),
    );
  }
}


//
// class LoveCalculator extends StatefulWidget {
//   @override
//   _LoveCalculatorState createState() => _LoveCalculatorState();
// }
//
// class _LoveCalculatorState extends State<LoveCalculator> {
//   TextEditingController maleNameController = TextEditingController();
//   TextEditingController femaleNameController = TextEditingController();
//   double lovePercentage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: 200,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Color(0xFF6A79DA),
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//             ),
//             child: Center(
//               child: Text(
//                 'Love Calculator',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: maleNameController,
//                   decoration: InputDecoration(
//                     labelText: 'Male Name',
//                     prefixIcon: Icon(Icons.person_outline),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 TextField(
//                   controller: femaleNameController,
//                   decoration: InputDecoration(
//                     labelText: 'Female Name',
//                     prefixIcon: Icon(Icons.person_outline),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: Color(0xFFEA5066),
//
//                   ),
//                   child: Text(
//                     'Calculate',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       lovePercentage = calcLove(
//                           maleNameController.text, femaleNameController.text);
//                     });
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   '$lovePercentage%',
//                   style: TextStyle(
//                     color: Color(0xFFEA5066),
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   double calcLove(String maleName, String femaleName) {
//     int totalLength = maleName.length + femaleName.length;
//     int loveScore = 0;
//     for (int i = 0; i < totalLength; i++) {
//       if (i % 2 == 0) {
//         loveScore += maleName.codeUnitAt(i % maleName.length);
//       } else {
//         loveScore += femaleName.codeUnitAt(i % femaleName.length);
//       }
//     }
//     return loveScore % 100;
//   }
// }
