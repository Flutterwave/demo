import 'package:flutter/material.dart';

import '../main.dart';

class PaymentSuccessful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/check.png", height: 100, width: 100),
            SizedBox(height: 20),
            Text(
              "Order Successful",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () => {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MyHomePage(title: "Restaurants"),
                    ),
                    (route) => false,
                  )
                },
                child: Text(
                  "CONTINUE SHOPPING",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
