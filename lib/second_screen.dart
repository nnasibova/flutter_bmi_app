import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final double answer;

  const SecondScreen({Key? key, required this.answer}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String ifAnswer = "Press to know your healthy range";

  ifResult() {
    setState(() {
      if (widget.answer >= 25) {
        ifAnswer = "Overweight";
      } else if (widget.answer >= 18) {
        ifAnswer = "Normal";
      } else {
        ifAnswer = "Underweight";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 189, 13, 0),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Result",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 100, bottom: 100, left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 12, 9, 34),
                borderRadius: BorderRadius.circular(45),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your result: ${widget.answer.toStringAsFixed(1)}",
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: boxDecoration(),
                      child: Center(
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                ifResult();
                              });
                            },
                            child: Text(
                              ifAnswer,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 3),
                      decoration: boxDecoration(),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Press to calculate again",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

BoxDecoration boxDecoration() {
  return BoxDecoration(
    color: const Color.fromARGB(255, 238, 16, 0),
    borderRadius: BorderRadius.circular(15),
  );
}
