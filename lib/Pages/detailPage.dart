import 'package:flutter/material.dart';
import 'package:love_calculator/Pages/mainScreen.dart';

import '../Ui kit/ui.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage(
      {Key? key,
      required this.result,
      required this.percentage,
      required this.maleName,
      required this.femaleName})
      : super(key: key);
  final String result;
  final String percentage;
  final String maleName;
  final String femaleName;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left_sharp,
                      color: MyColor.textColor1,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                          color: MyColor.textColor1,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 25, letterSpacing: 0.5),
                      children: [
                    TextSpan(
                      text: "Your ",
                      style: TextStyle(
                          color: MyColor.mainColor1,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "Summary",
                      style: TextStyle(
                        color: MyColor.textColor1,
                      ),
                    ),
                  ])),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      children: [
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  fontSize: 35,
                                ),
                                children: [
                              TextSpan(
                                text: "Your Love is",
                                style: TextStyle(
                                  color: MyColor.textColor1,
                                ),
                              ),
                            ])),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                            text: TextSpan(
                                style:
                                    TextStyle(fontSize: 65, letterSpacing: 0.5),
                                children: [
                              TextSpan(
                                text: "${widget.percentage}%",
                                style: TextStyle(
                                    color: MyColor.mainColor1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ])),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 22, letterSpacing: 0.5),
                      children: [
                    TextSpan(
                      text: "${widget.maleName}",
                      style: TextStyle(
                          color: MyColor.mainColor1,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: " and ",
                      style: TextStyle(
                        color: MyColor.textColor1,
                      ),
                    ),
                    TextSpan(
                      text: "${widget.femaleName} ",
                      style: TextStyle(
                          color: MyColor.mainColor1,
                          fontWeight: FontWeight.bold),
                    ),
                  ])),
              SizedBox(
                height: 70,
              ),
              Text(
                "Result : ",
                style: TextStyle(
                    color: MyColor.textColor1,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: MyColor.mainColor1,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(fontSize: 22, letterSpacing: 0.5),
                          children: [
                        TextSpan(
                          text: "${widget.result}",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ])),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.share,
                        color: MyColor.textColor1,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: MyColor.mainColor1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.save_alt,
                        color: MyColor.textColor1,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
