import 'package:flutter/material.dart';
import 'package:project_pemob/screens/dashboard_screens.dart';
import 'package:project_pemob/screens/home_screen.dart';
import 'package:project_pemob/screens/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }  
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
                height: 300,
                width: 300,
                child: Image.asset('assets/images/logoo.png'),
              ),
            ),
            Text(
              "LOGIN",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins Regular',
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
                controller: _emailController,
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
                controller: _passwordController,
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
                        _signIn();
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: Center(
                          child: Text(
                            "Login",
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

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      _showSuccessDialog();
      print("User is successfully signed in");
    } else {
      _showErrorDialog();
      print("Email atau Password Salah!");
    }
  }

  void _showSuccessDialog() {
    List<String> emailParts = _emailController.text.split('@');
    String username = emailParts[0]; // Get the username part
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Successful!'),
          content: Text('Welcome back, $username!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the success dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('OK'),
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
          title: Text('Login Failed'),
          content: Text('Invalid email or password. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
