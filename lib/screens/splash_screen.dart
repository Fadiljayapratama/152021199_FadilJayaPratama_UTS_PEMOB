import 'package:flutter/material.dart';
import 'package:project_pemob/screens/login_screen.dart';
import 'package:project_pemob/screens/register_screen.dart';

class SplashScreens extends StatelessWidget {
  const SplashScreens({super.key});

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
                height: 315,
                width: 315,
                child: Image.asset('assets/images/logoo.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: SizedBox(
                  height: 60,
                  width: 228,
                  child: Text(
                    'WELCOME TO All-in-One Fusion',
                    style: TextStyle(
                      fontFamily: 'Poppins Medium',
                      fontSize: 20,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: SizedBox(
                  height: 50,
                  width: 228,
                  child: Text(
                    'Menghubungkan Anda ke Berbagai Kebutuhan',
                    style: TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontSize: 14,
                    ),
                  )),
            ),
            SizedBox(
              height: 40,
              width: 300,
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
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
            ),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 33,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins Regular',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'PoppinsBold',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
