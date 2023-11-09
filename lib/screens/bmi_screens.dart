import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  double bmi = 0;
  String bmiCategory = '';
  String selectedGender = ''; // 'male' or 'female'

  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0;

    if (height > 0 && weight > 0 && selectedGender.isNotEmpty) {
      setState(() {
        bmi = weight / ((height / 100) * (height / 100));

        if (bmi < 18.5) {
          bmiCategory = 'Underweight';
        } else if (bmi >= 18.5 && bmi < 25) {
          bmiCategory = 'Normal';
        } else if (bmi >= 25 && bmi < 30) {
          bmiCategory = 'Overweight';
        } else {
          bmiCategory = 'Obese';
        }

        _showBMIDialog();
      });
    } else {
      _showErrorDialog();
    }
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  void _showBMIDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your BMI'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Your BMI is: ${bmi.toStringAsFixed(1)}'),
              SizedBox(height: 10),
              Text('Category: $bmiCategory'),
              SizedBox(height: 10),
              Text('Gender: $selectedGender'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content:
              Text('Please enter valid height, weight, and select gender.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'BMI CALCULATOR',
                    style: TextStyle(fontFamily: 'Poppins Bold'),
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset('assets/images/lambang.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Male';
                      });
                    },
                    child: Icon(
                      Icons.male,
                      size: 50,
                      color:
                          selectedGender == 'Male' ? Colors.blue : Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Female';
                      });
                    },
                    child: Icon(
                      Icons.female,
                      size: 50,
                      color: selectedGender == 'Female'
                          ? Colors.pink
                          : Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter your height (cm)',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter your weight (kg)',
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 55,
                width: 350,
                child: Material(
                    color: Color(0xFF61BC84),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: calculateBMI,
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => HomeScreen(),
                      //     ));
                      // },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: Center(
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
