import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:love_calculator/Pages/detailPage.dart';

import '../AppUrl.dart';
import '../Ui kit/ui.dart';

enum ButtonState { init, submitting, completed }
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool male = true;
  final maleController = TextEditingController();
  final femaleController = TextEditingController();
  final maleAgeController = TextEditingController();
  final femaleAgeController = TextEditingController();
  bool maleCheck = false;
  bool femaleCheck = false;
  bool isAnimating = true;
  ButtonState state = ButtonState.init;

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width;
    final isInit = isAnimating || state == ButtonState.init;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          setState(() {
            FocusManager.instance.primaryFocus?.unfocus();
          });
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        style: TextStyle(fontSize: 25, letterSpacing: 0.5),
                        children: [
                      TextSpan(
                        text: 'Love ',
                        style: TextStyle(
                            color: MyColor.mainColor1,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Calculator',
                        style: TextStyle(
                          color: MyColor.textColor1,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(
                        style: TextStyle(fontSize: 12, letterSpacing: 0.5),
                        children: [
                      TextSpan(
                        text:
                            'Welcome to our Love Calculator! Enter the names of the two people you want to calculate the love between, and press the Calculate button to find out the percentage of love between them. So what are you waiting for? Try it out and find out how much love is truly in the air!',
                        style: TextStyle(
                          color: MyColor.textColor1,
                        ),
                      ),
                    ])),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: male == true ? 1 : 0.3,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            male = true;
                            print(male);
                          });
                        },
                        child: Stack(
                          children: [
                            Image(
                              image: AssetImage(
                                "images/male.png",
                              ),
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: MediaQuery.of(context).size.width / 2.3,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 75,
                              child: Text(
                                "Male",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: MyColor.textColor1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: male == false ? 1 : 0.3,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            male = false;
                            print(male);
                          });
                        },
                        child: Stack(
                          children: [
                            Image(
                              image: AssetImage(
                                "images/female.png",
                              ),
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: MediaQuery.of(context).size.width / 2.3,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 70,
                              child: Text(
                                "Female",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: MyColor.textColor1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: male == true ? true : false,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Male Name : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: MyColor.textColor1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: maleController,
                            decoration: InputDecoration(
                                hintText: "Enter the male name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Age : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: MyColor.textColor1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: maleAgeController,
                            decoration: InputDecoration(
                                hintText: "Enter the male's age ",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              // checkColor: MyColor.mainColor1,
                              // splashRadius: 3,
                              // hoverColor: MyColor.mainColor2,
                              value: this.maleCheck,
                              onChanged: (value) {
                                setState(() {
                                  maleCheck = value!;
                                  print(maleCheck);
                                });
                              },
                            ),
                          ),
                          Text(
                            "First sight love",
                            style: TextStyle(
                              fontSize: 16,
                              color: MyColor.textColor1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: male == false ? true : false,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Female Name : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: MyColor.textColor1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: femaleController,
                            decoration: InputDecoration(
                                hintText: "Enter the female name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Age : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: MyColor.textColor1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: femaleAgeController,
                            decoration: InputDecoration(
                                hintText: "Enter the female's age",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                  // checkColor: MyColor.mainColor1,
                                  // splashRadius: 3,
                                  // hoverColor: MyColor.mainColor2,
                                  value: this.femaleCheck,
                                  onChanged: (value) {
                                    setState(() {
                                      femaleCheck = value!;
                                      print(femaleCheck);
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "First sight love",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: MyColor.textColor1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                maleController.text != "" && femaleController.text != ""
                    ? Container(
                  alignment: Alignment.center,
                  // padding: EdgeInsets.all(40),
                  child: AnimatedContainer(
                      duration:
                      Duration(milliseconds: 300),
                      onEnd: () => setState(() {
                        isAnimating = !isAnimating;
                      }),
                      width: state == ButtonState.init
                          ? buttonWidth
                          : 300,
                      height: 65,
                      // If Button State is Submiting or Completed  show 'buttonCircular' widget as below
                      child: isInit
                          ? Container(
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(
                              Radius.circular(
                                  20.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(
                                  0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0,
                                  3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          15.0),
                                    )),
                                backgroundColor:
                                MaterialStateProperty
                                    .all(MyColor
                                    .mainColor1)),
                            onPressed: () async {
                              setState(() {
                                print("object");
                                if (maleController
                                    .value
                                    .text
                                    .isNotEmpty &&
                                    femaleController
                                        .value
                                        .text
                                        .isNotEmpty) {

                                  state = ButtonState
                                      .submitting;
                                } else {

                                }
                              });

                              //await 2 sec // you need to implement your server response here.
                              await Future.delayed(
                                  Duration(
                                      seconds: 1));
                              setState(() {
                                if (maleController
                                    .value
                                    .text
                                    .isNotEmpty &&
                                    femaleController
                                        .value
                                        .text
                                        .isNotEmpty) {

                                  getPercentage();

                                  state = ButtonState
                                      .completed;

                                } else {

                                }
                              });
                              await Future.delayed(
                                  Duration(
                                      seconds: 2));
                              setState(() {
                                if (maleController
                                    .value
                                    .text
                                    .isNotEmpty &&
                                    femaleController
                                        .value
                                        .text
                                        .isNotEmpty) {

                                  state =
                                      ButtonState
                                          .init;

                                }
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        style:
                                        TextStyle(fontSize: 16,),
                                        children: [
                                          TextSpan(
                                            text: 'Calculate your love',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),

                                        ])),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.white,
                                )
                              ],
                            )
                        ),
                      )
                          : Container(
                        decoration: BoxDecoration(
                            shape:
                            BoxShape.circle,
                            color: MyColor
                                .mainColor1),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors
                                .white,
                          ),
                        ),
                      )),
                )
                    : Column(
                        children: [
                          RichText(
                              text: TextSpan(
                                  style:
                                      TextStyle(fontSize: 15, letterSpacing: 0.5),
                                  children: [
                                TextSpan(
                                  text: '* ',
                                  style: TextStyle(
                                    color: MyColor.mainColor1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Please make sure that the field of both ',
                                  style: TextStyle(
                                    color: MyColor.textColor1,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Male',
                                  style: TextStyle(
                                    color: MyColor.mainColor1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                    color: MyColor.textColor1,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Female ',
                                  style: TextStyle(
                                    color: MyColor.mainColor1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'is required ',
                                  style: TextStyle(color: MyColor.textColor1
                                      // fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ])),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                              text: TextSpan(
                                  style:
                                      TextStyle(fontSize: 15, letterSpacing: 0.5),
                                  children: [
                                TextSpan(
                                  text: '* ',
                                  style: TextStyle(
                                    color: MyColor.mainColor1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Please fill the both field by clicking ',
                                  style: TextStyle(
                                    color: MyColor.textColor1,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Male',
                                  style: TextStyle(
                                    color: MyColor.mainColor1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                    color: MyColor.textColor1,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Female ',
                                  style: TextStyle(
                                    color: MyColor.mainColor1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'avatars to calculate your love ',
                                  style: TextStyle(color: MyColor.textColor1
                                      // fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ])),
                        ],
                      ),




              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getPercentage() async {
    Map<String, String> headers = {
      "X-RapidAPI-Key": "4125166edamsh1f1046759a58aa9p19ba8ejsndf5c5eba5b36",
      "X-RapidAPI-Host": "love-calculator.p.rapidapi.com"
    };
    // print(headers['Authorization']);
    try {
      Response response = await get(
          Uri.parse(AppUrl.baseUrl +
              AppUrl.percentage +
              maleController.text +
              "&fname=" +
              femaleController.text),
          headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        print(data);
        Future.delayed(Duration(seconds: 3));

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailsPage(
          maleName: data['sname'],
          femaleName: data['fname'],
          percentage: data['percentage'],
          result: data['result'],
        )));
        setState(() {
          maleController.clear();
          femaleController.clear();
        });
      } else
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Oops something went wrong ${response.statusCode}")));
    } catch (e) {
      print(e.toString());
    }
  }
}
