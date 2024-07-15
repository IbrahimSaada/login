import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerificationPage(),
    ));

class VerificationPage extends StatelessWidget {
  final int codeLength = 6;

  const VerificationPage({super.key}); // Define the code length here

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
                        "Verify Your Account",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(codeLength, (index) {
                          return Container(
                            width: 40,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27,.3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ],
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            child: const Center(
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  counterText: "", // Hide the counter text
                                  hintText: "",
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(fontSize: 24),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                              ),
                            ),
                          );
                        }),
                      ),
                           const SizedBox(
                        height: 40,
                      ),
                     FadeInUp(
  duration: const Duration(milliseconds: 1600),
  child: MaterialButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    },
    height: 50,
    color: Colors.orange[900],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    child: const Center(
      child: Text(
        "Verify",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
)
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