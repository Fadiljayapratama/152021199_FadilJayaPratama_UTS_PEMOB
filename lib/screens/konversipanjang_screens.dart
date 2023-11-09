import 'package:flutter/material.dart';

class KonversiPanjang extends StatefulWidget {
  @override
  _KonversiPanjangState createState() => _KonversiPanjangState();
}

class _KonversiPanjangState extends State<KonversiPanjang> {
  double inputLength = 0;
  double convertedLength = 0;
  String inputUnit = 'km';
  String outputUnit = 'km';

  TextEditingController inputController = TextEditingController();

  void convertLength() {
    setState(() {
      double inputValue = double.parse(inputController.text);
      inputLength = inputValue;

      // Konversi ke meter sebagai satuan dasar
      double inputInMeter = 0;

      switch (inputUnit) {
        case 'km':
          inputInMeter = inputLength * 1000;
          break;
        case 'hm':
          inputInMeter = inputLength * 100;
          break;
        case 'dam':
          inputInMeter = inputLength * 10;
          break;
        case 'm':
          inputInMeter = inputLength;
          break;
        case 'dm':
          inputInMeter = inputLength / 10;
          break;
        case 'cm':
          inputInMeter = inputLength / 100;
          break;
        case 'mm':
          inputInMeter = inputLength / 1000;
          break;
      }

      // Konversi dari meter ke satuan output
      switch (outputUnit) {
        case 'km':
          convertedLength = inputInMeter / 1000;
          break;
        case 'hm':
          convertedLength = inputInMeter / 100;
          break;
        case 'dam':
          convertedLength = inputInMeter / 10;
          break;
        case 'm':
          convertedLength = inputInMeter;
          break;
        case 'dm':
          convertedLength = inputInMeter * 10;
          break;
        case 'cm':
          convertedLength = inputInMeter * 100;
          break;
        case 'mm':
          convertedLength = inputInMeter * 1000;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Konversi Satuan Panjang",
              style: TextStyle(
                  fontFamily: 'poppinssemibold',
                  fontSize: 30,
                  color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: inputController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFE1E1E1),
                  hintText: "Masukkan satuan panjang",
                  hintStyle: TextStyle(color: Color(0xFF9A9A9A)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: inputUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      inputUnit = newValue!;
                    });
                  },
                  items: <String>['km', 'hm', 'dam', 'm', 'dm', 'cm', 'mm']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: outputUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      outputUnit = newValue!;
                    });
                  },
                  items: <String>['km', 'hm', 'dam', 'm', 'dm', 'cm', 'mm']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: convertLength,
              child: Text('Convert'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 50,
              child: TextField(
                controller: TextEditingController(
                    text: convertedLength.toStringAsFixed(2)),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  labelText: 'Hasil Konversi',
                  fillColor: Color(0xFFE1E1E1),
                  hintStyle: TextStyle(color: Colors.black),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
