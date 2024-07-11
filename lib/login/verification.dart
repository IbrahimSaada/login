import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerificationPage(),
    ));

class VerificationPage extends StatelessWidget {
  final int codeLength = 6; // Define the code length here

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
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Text(
                        "Verify Your Account",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                 
                ],
              ),
            ),
           SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
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
                              boxShadow: [
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
                            child: Center(
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
                           SizedBox(
                        height: 40,
                      ),
                     FadeInUp(
  duration: Duration(milliseconds: 1600),
  child: MaterialButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    },
    height: 50,
    color: Colors.orange[900],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
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