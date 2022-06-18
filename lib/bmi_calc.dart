import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/second_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiCalc extends StatefulWidget {
  const BmiCalc({Key? key}) : super(key: key);

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  Color colorOfLittleBox = const Color.fromARGB(255, 27, 28, 48);
  Color colorOfLittleBox2 = const Color.fromARGB(255, 27, 28, 48);
  double _value = 150;
  int weight = 60;
  int age = 25;
  double answer = 10;
  String calc = "CALCULATE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Bmi Calculator",
          style: TextStyle(color: Colors.white, letterSpacing: 2, fontSize: 25),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 12, 9, 34),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  FemaleBox("MALE", Icons.male),
                  FemaleBox("FEMALE", Icons.female),
                ],
              ),
              Column(children: [
                Container(
                    padding: const EdgeInsets.all(32),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 27, 28, 48),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("HEIGHT",
                            style: TextStyle(color: Colors.grey, fontSize: 20)),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(_value.toStringAsFixed(0),
                                style: const TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900)),
                            const Text(
                              "cm",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                          ],
                        ),
                        Slider(
                          min: 100,
                          max: 230,
                          thumbColor: const Color.fromARGB(255, 238, 16, 0),
                          value: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          },
                        ),
                      ],
                    ))
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Operation("WEIGHT"),
                  Operation("AGE"),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 0, 0),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.only(bottom: 5),
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  child: Text(
                    calc,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.w900),
                  ),
                  onPressed: () {
                    answer = (weight / (_value * _value)) * 10000;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondScreen(
                                answer: answer,
                              )),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Operation(String option) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.all(40),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 27, 28, 48),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(option,
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 20, letterSpacing: 1.0)),
                Text(
                  option == "WEIGHT" ? weight.toString() : age.toString(),
                  style: const TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(45),
                        color: const Color.fromARGB(255, 76, 79, 94),
                      ),
                      child: IconButton(
                        iconSize: 23,
                        icon: const Icon(FontAwesomeIcons.minus,
                            color: Colors.white),
                        onPressed: () {
                          setState(() {
                            if (option == "WEIGHT") {
                              weight--;
                            } else {
                              age--;
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: const Color.fromARGB(255, 76, 79, 94),
                      ),
                      child: IconButton(
                        iconSize: 23,
                        icon: const Icon(FontAwesomeIcons.plus,
                            color: Colors.white),
                        onPressed: () {
                          setState(() {
                            if (option == "WEIGHT") {
                              weight++;
                            } else {
                              age++;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget FemaleBox(String text, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (text == "MALE") {
              colorOfLittleBox = const Color.fromARGB(255, 238, 16, 0);
              colorOfLittleBox2 = const Color.fromARGB(255, 27, 28, 48);
            } else {
              colorOfLittleBox = const Color.fromARGB(255, 27, 28, 48);
              colorOfLittleBox2 = const Color.fromARGB(255, 238, 16, 0);
            }
          });
        },
        child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: text == "MALE" ? colorOfLittleBox : colorOfLittleBox2,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 100,
                    color: Colors.white,
                  ),
                  Text(text,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          letterSpacing: 1.0)),
                ],
              ),
            )),
      ),
    );
  }
}
