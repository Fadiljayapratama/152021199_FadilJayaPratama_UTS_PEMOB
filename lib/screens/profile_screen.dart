import 'package:flutter/material.dart';
import 'package:project_pemob/screens/about_screens.dart';
import 'package:project_pemob/screens/register_screen.dart';
import 'package:project_pemob/screens/home_screen.dart';
import 'package:feather_icons/feather_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FeatherIcons.chevronLeft,
                        color: const Color(0xFF838383),
                        size: 27,
                      )),
                )
              ],
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Center(
                child: Text(
                  "Fadil Jaya Pratama",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'poppinssemibold',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Center(
                child: Text(
                  "fadiljay20@gmail.com",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'poppinssemibold',
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: 320,
                width: 380,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Personal info',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.date_range),
                          decoration: BoxDecoration(
                            color: Color(0xFFDFF2E6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        title: Text(
                          "Date of Birth",
                          style: TextStyle(
                            fontFamily: "poppinsregular",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          '20 November 2002',
                          style: TextStyle(
                            fontFamily: "poppinssemibold",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: Icon(FeatherIcons.mail),
                          decoration: BoxDecoration(
                            color: Color(0xFFDFF2E6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        title: Text(
                          "E-mail",
                          style: TextStyle(
                            fontFamily: "poppinsregular",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          'fadiljay20@gmail.com',
                          style: TextStyle(
                            fontFamily: "poppinssemibold",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: Icon(FeatherIcons.phone),
                          decoration: BoxDecoration(
                            color: Color(0xFFDFF2E6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        title: Text(
                          "Phone Number",
                          style: TextStyle(
                            fontFamily: "poppinsregular",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          '081223892921',
                          style: TextStyle(
                            fontFamily: "poppinssemibold",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.language),
                          decoration: BoxDecoration(
                            color: Color(0xFFDFF2E6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        title: Text(
                          "Languanges",
                          style: TextStyle(
                            fontFamily: "poppinsregular",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          'Indonesia, English, Japanese',
                          style: TextStyle(
                            fontFamily: "poppinssemibold",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: 380,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.place),
                          decoration: BoxDecoration(
                            color: Color(0xFFDFF2E6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        title: Text(
                          "Places",
                          style: TextStyle(
                            fontFamily: "poppinsregular",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          'Komplek Sanggar Mas Lestari Blok E No.60 Bandung',
                          style: TextStyle(
                            fontFamily: "poppinssemibold",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.interests),
                          decoration: BoxDecoration(
                            color: Color(0xFFDFF2E6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        title: Text(
                          "Interests",
                          style: TextStyle(
                            fontFamily: "poppinsregular",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          'Travelling,Adventure,Friendship',
                          style: TextStyle(
                            fontFamily: "poppinssemibold",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AboutPage(),
                                ));
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.info_outlined),
                            decoration: BoxDecoration(
                              color: Color(0xFFDFF2E6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        title: Text(
                          "About",
                          style: TextStyle(
                            fontFamily: "poppinsregular",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          'About app',
                          style: TextStyle(
                            fontFamily: "poppinssemibold",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
