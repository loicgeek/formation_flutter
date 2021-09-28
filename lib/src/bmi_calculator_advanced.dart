import 'package:flutter/material.dart';

class BmiCalculatorAdvanced extends StatefulWidget {
  const BmiCalculatorAdvanced({Key? key}) : super(key: key);

  @override
  _BmiCalculatorAdvancedState createState() => _BmiCalculatorAdvancedState();
}

class _BmiCalculatorAdvancedState extends State<BmiCalculatorAdvanced> {
  late double taillePatient;
  late double massePatient;
  late String message;
  late double bmiResult;
  late TextEditingController _tailleController;

  @override
  void initState() {
    this.initVariables();
    super.initState();
  }

  initVariables() {
    taillePatient = 120;
    massePatient = 50;
    _tailleController = TextEditingController();
    this.calculateBmi();
  }

  calculateBmi() {
    bmiResult = massePatient / taillePatient / taillePatient * 10000;
    bmiResult = double.parse(bmiResult.toStringAsFixed(2));
    if (bmiResult < 18.5) {
      message = "Poids Insuffisant";
    } else if (bmiResult < 24.9) {
      message = "poids Normal";
    } else if (bmiResult < 29.9) {
      message = "Exces Ponderal, Surpoids";
    } else if (bmiResult < 39.9) {
      message = "Obesite";
    } else {
      message = "Obesite Morbide";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text("$bmiResult"),
                Text("$message"),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: _tailleController,
                            keyboardType: TextInputType.numberWithOptions(),
                          ),
                        ),
                        Text("Taille"),
                        Text("$taillePatient Cm"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                taillePatient = taillePatient - 1;
                                this.calculateBmi();
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.remove),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                taillePatient = taillePatient + 1;
                                this.calculateBmi();
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Masse"),
                        Text("$massePatient Kg"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                massePatient = massePatient - 1;
                                this.calculateBmi();
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.remove),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                massePatient = massePatient + 1;
                                this.calculateBmi();
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            this.initVariables();
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "reinitialiser".toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (double.tryParse(_tailleController.text) != null) {
              taillePatient = double.tryParse(_tailleController.text)!;
              this.calculateBmi();
              setState(() {});
            }
            // this.calculateBmi();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "CALCULER".toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
