import 'package:flutter/material.dart';

class KonversiUang extends StatefulWidget {
  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<KonversiUang> {
  double amount = 0.0;
  String fromCurrency = 'USD';
  String toCurrency = 'USD'; // Mata uang tujuan default
  double convertedAmount = 0.0;

  // Daftar faktor konversi mata uang
  final Map<String, Map<String, double>>? currencyConversionRates = {
    'USD': {
      'USD': 1.0,
      'EUR': 0.85,
      'GBP': 0.73,
      'JPY': 110.33,
      'IDR': 14000.0
    },
    'EUR': {
      'USD': 1.18,
      'EUR': 1.0,
      'GBP': 0.87,
      'JPY': 130.62,
      'IDR': 16548.0
    },
    'GBP': {
      'USD': 1.37,
      'EUR': 1.15,
      'GBP': 1.0,
      'JPY': 150.37,
      'IDR': 19059.0
    },
    'JPY': {
      'USD': 0.0091,
      'EUR': 0.0077,
      'GBP': 0.0067,
      'JPY': 1.0,
      'IDR': 127.07
    },
    'IDR': {
      'USD': 0.0000714,
      'EUR': 0.0000604,
      'GBP': 0.0000524,
      'JPY': 0.0079,
      'IDR': 1.0
    },
  };

  // Fungsi untuk mengonversi mata uang
  void convertCurrency() {
    final Map<String, double>? fromCurrencyMap =
        currencyConversionRates?[fromCurrency];
    if (fromCurrencyMap != null) {
      final double? conversionRate = fromCurrencyMap[toCurrency];
      if (conversionRate != null) {
        convertedAmount = amount * conversionRate;
        setState(() {});
      } else {
        // Handle error jika mata uang tujuan tidak ditemukan
        // Misalnya, tampilkan pesan kesalahan atau nilai default
      }
    } else {
      // Handle error jika mata uang asal tidak ditemukan
      // Misalnya, tampilkan pesan kesalahan atau nilai default
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             Row(
              children: [
                Text(
                  'BMI CALCULATOR',
                  style: TextStyle(fontFamily: 'Poppins Bold'),
                ),
              ],
            ),
            // ListTile(
            //   leading: Icon(Icons.home),
            //   title: Text('Beranda'),
            //   onTap: () {
            //     // Tambahkan logika navigasi ke beranda
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => DashboardPage(),
            //       ),
            //     );
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.calculate), // Icon kalkulator
            //   title: Text('Kalkulator'),
            //   onTap: () {
            //     // Tambahkan logika navigasi ke halaman Kalkulator
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => KalkulatorPage(),
            //       ),
            //     );
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.info), // Icon about
            //   title: Text('About'),
            //   onTap: () {
            //     // Tambahkan logika navigasi ke halaman About
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => AboutPage(),
            //       ),
            //     );
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.calculate), // Icon Currency
            //   title: Text('Currency'),
            //   onTap: () {
            //     // Tidak perlu ada perubahan pada halaman Currency Converter
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.calculate), // Icon BMI
            //   title: Text('BMI'),
            //   onTap: () {
            //     // Tambahkan logika untuk menavigasi ke halaman BMI (bmi.dart)
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => BmiPage(),
            //       ),
            //     );
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.exit_to_app),
            //   title: Text('Logout'),
            //   onTap: () {
            //     // Tambahkan logika logout di sini
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => LoginPage(),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter amount:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amount = double.tryParse(value) ?? 0.0;
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Convert from:',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<String>(
              value: fromCurrency,
              onChanged: (value) {
                setState(() {
                  fromCurrency = value!;
                });
              },
              items: currencyConversionRates?.keys.map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList() ??
                  [],
            ),
            SizedBox(height: 20.0),
            Text(
              'Convert to:',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<String>(
              value: toCurrency,
              onChanged: (value) {
                setState(() {
                  toCurrency = value!;
                });
              },
              items: currencyConversionRates?.keys.map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList() ??
                  [],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                convertCurrency();
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Converted amount: $convertedAmount $toCurrency',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
