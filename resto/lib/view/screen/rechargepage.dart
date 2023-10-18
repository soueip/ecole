import 'package:flutter/material.dart';

import '../widget/auth/authbutom.dart';

class Recharge extends StatelessWidget {
  const Recharge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recharge'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter Recharge Amount',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                prefixText: '\$',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              hint: Text('Select Payment Method'),
              items: ['Credit Card', 'Debit Card', 'Net Banking', 'Wallet']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                // Handle payment method selection
              },
            ),
            SizedBox(height: 30),
            AuthButton(
              text: "Recharge",
              onPressed: () {
                // controller.login();
              },
            ),
          ],
        ),
      ),
    );
  }
}
