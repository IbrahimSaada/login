import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import '../login/forgotpasswrodver.dart';
void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgotpasswrodhomePage(),
    ));

class ForgotpasswrodhomePage extends StatelessWidget {
  const ForgotpasswrodhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange.shade900,
          Colors.orange.shade800,
          Colors.orange.shade400
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: const Text(
                        "Find your account",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                 
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 60,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27,.3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        hintText: "Enter your email or phone number",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                               
                              ],
                            ),
                          )),
                           const SizedBox(
                        height: 40,
                      ),
                     FadeInUp(
  duration: const Duration(milliseconds: 1600),
  child: MaterialButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ForgotpasswrodhomePage()),
      );
    },
    height: 50,
    color: Colors.orange[900],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    child: const Center(
      child: Text(
        "Resend code",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
),
const SizedBox(
                        height: 40,
                      ),
                     FadeInUp(
  duration: const Duration(milliseconds: 1600),
  child: MaterialButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ForgotpasswrodverPage()),
      );
    },
    height: 50,
    color: Colors.orange[900],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    child: const Center(
      child: Text(
        "Continue",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
),
  const SizedBox(
                        height: 40,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1500),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            child: const Text(
                              "Back to login page",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )),
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