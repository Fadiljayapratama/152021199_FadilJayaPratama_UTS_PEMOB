import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displayTxt = '0';
  double numOne = 0;
  double numTwo = 0;
  dynamic result = '';
  dynamic finalResult = '';
  dynamic operand = '';
  dynamic preOperand = '';

  void calculation(String buttonText) {
    if (buttonText == 'AC') {
      setState(() {
        displayTxt = '0';
        numOne = 0;
        numTwo = 0;
        result = '';
        finalResult = '0';
        operand = '';
        preOperand = '';
      });
    } else if (buttonText == '+' || buttonText == '-' || buttonText == 'x' || buttonText == '/') {
      setState(() {
        numOne = double.parse(displayTxt);
        operand = buttonText;
        result = '';
        displayTxt = '0';
      });
    } else if (buttonText == '=') {
      setState(() {
        numTwo = double.parse(displayTxt);
        if (operand == '+') {
          finalResult = (numOne + numTwo).toString();
        } else if (operand == '-') {
          finalResult = (numOne - numTwo).toString();
        } else if (operand == 'x') {
          finalResult = (numOne * numTwo).toString();
        } else if (operand == '/') {
          if (numTwo == 0) {
            finalResult = "Error";
          } else {
            finalResult = (numOne / numTwo).toString();
          }
        }

        finalResult = removeDecimalIfZero(finalResult); // Hilangkan desimal jika angka 0 setelah desimal

        displayTxt = finalResult;
        numOne = double.parse(finalResult);
        operand = '';
      });
    } else {
      setState(() {
        if (displayTxt == '0') {
          displayTxt = buttonText;
        } else {
          displayTxt = displayTxt + buttonText;
        }
      });
    }
  }

  // Fungsi untuk menghilangkan desimal jika 0 setelah desimal
  String removeDecimalIfZero(String value) {
    if (value.contains('.')) {
      List<String> splitValue = value.split('.');
      if (splitValue.length > 1 && int.parse(splitValue[1]) == 0) {
        return splitValue[0];
      }
    }
    return value;
  }

  Widget calcButton(String buttonText, Color buttonColor, Color textColor) {
    return InkWell(
      onTap: () {
        calculation(buttonText);
      },
      child: Ink(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: buttonColor,
        ),
        child: Center(
          child: Text(
            '$buttonText',
            style: TextStyle(
              fontSize: 35,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '$displayTxt',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton('AC', Colors.grey, Colors.black),
                calcButton('+/-', Colors.grey, Colors.black),
                calcButton('%', Colors.grey, Colors.black),
                calcButton('/', Colors.amber[700]!, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton('7', Colors.grey, Colors.white),
                calcButton('8', Colors.grey, Colors.white),
                calcButton('9', Colors.grey, Colors.white),
                calcButton('x', Colors.amber[700]!, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton('4', Colors.grey, Colors.white),
                calcButton('5', Colors.grey, Colors.white),
                calcButton('6', Colors.grey, Colors.white),
                calcButton('-', Colors.amber[700]!, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton('1', Colors.grey, Colors.white),
                calcButton('2', Colors.grey, Colors.white),
                calcButton('3', Colors.grey, Colors.white),
                calcButton('+', Colors.amber[700]!, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    calculation('0');
                  },
                  child: Ink(
                    height: 80,
                    width: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      shape: BoxShape.rectangle,
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        '0',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                calcButton('.', Colors.grey, Colors.white),
                calcButton('=', Colors.amber[700]!, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
