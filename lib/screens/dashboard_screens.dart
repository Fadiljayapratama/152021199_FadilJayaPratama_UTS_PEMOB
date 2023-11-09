import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pemob/screens/bmi_screens.dart';
import 'package:project_pemob/screens/kalkulator_screens.dart';
import 'package:project_pemob/screens/konversipanjang_screens.dart';
import 'package:project_pemob/screens/konversisuhu_screens.dart';
import 'package:project_pemob/screens/konversiuang_screens.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Wrap(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/images/profile.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/images/logoo.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Text(
                        "WELLCOME",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins Bold',
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 9, right: 20, left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFF),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        prefixIcon: Icon(CupertinoIcons.search),
                        hintText: 'Search',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BMICalculator(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(208, 233, 225, 225),
                            borderRadius: BorderRadius.circular(8)),
                        height: 150,
                        width: 150,
                        child: Column(
                          children: [
                            SizedBox(
                                height: 120,
                                width: 120,
                                child:
                                    Image.asset('assets/images/lambang.png')),
                            Text(
                              'BMI CALCULATOR',
                              style: TextStyle(fontFamily: 'Poppins Bold'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Calculator(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(208, 233, 225, 225),
                            borderRadius: BorderRadius.circular(8)),
                        height: 150,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calculate, size: 75),
                            Text(
                              'Calculator',
                              style: TextStyle(fontFamily: 'Poppins Bold'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KonversiUang(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(208, 233, 225, 225),
                            borderRadius: BorderRadius.circular(8)),
                        height: 150,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.money, size: 75),
                            Text(
                              'Convertion',
                              style: TextStyle(fontFamily: 'Poppins Bold'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TemperatureConverter(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(208, 233, 225, 225),
                            borderRadius: BorderRadius.circular(8)),
                        height: 150,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.sun_max, size: 75),
                            Text(
                              'Temperature',
                              style: TextStyle(fontFamily: 'Poppins Bold'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Suggestion For You',
                            style: TextStyle(fontFamily: 'Poppins Bold'),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => KonversiPanjang(),
                                      ));
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.grey[400],
                                  child: Center(
                                    child: SizedBox(
                                        height: 90,
                                        width: 90,
                                        child: Image.asset(
                                            'assets/images/panjang.png')),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: 250,
                                child: Text(
                                    'Dalam setiap langkah hidup, jarak memiliki makna yang mendalam. Saat kita berjalan, setiap langkah mengubah kisah.  Seperti menyatukan detik dalam satu perjalanan, konversi panjang ini tak sekadar menjelaskan angka, melainkan cerminan dari perjalanan kita dalam meraih impian.'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
