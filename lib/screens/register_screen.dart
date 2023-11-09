import 'package:flutter/material.dart';
import 'package:project_pemob/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 10),
              child: SizedBox(
                height: 200,
                width: 300,
                child: Image.asset('assets/images/logoo.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins Regular',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 280, top: 10),
              child: Text(
                "Username",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins Regular',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 9, right: 20, left: 20),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 260, top: 10),
              child: Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins Regular',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 9, right: 20, left: 20),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 280, top: 10),
              child: Text(
                "Password",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins Regular',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 9, right: 20, left: 20),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36),
              child: SizedBox(
                height: 55,
                width: 350,
                child: Material(
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
