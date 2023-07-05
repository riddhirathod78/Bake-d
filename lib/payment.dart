import 'package:flutter/material.dart';

void main() {
  double totalAmount = 1120.0;
  runApp(MaterialApp(home: PaymentScreen(totalAmount: totalAmount,)));
}
class PaymentScreen extends StatefulWidget {
  final double totalAmount;

  PaymentScreen({required this.totalAmount});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = '';

  void _showPaymentMethodDialog(String method) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Payment Method'),
          content: Text('Are you sure you want to use $method for payment?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                setState(() {
                  _selectedMethod = method;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey.shade300,
              child: Text(
                'Total Amount: ₹${widget.totalAmount}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text('UPI'),
              leading: Icon(Icons.account_balance),
              trailing:
              _selectedMethod == 'UPI' ? Icon(Icons.check) : null,
              onTap: () {
                _showPaymentMethodDialog('UPI');
              },
            ),
            ListTile(
              title: Text('Credit Card'),
              leading: Icon(Icons.credit_card),
              trailing: _selectedMethod == 'Credit Card'
                  ? Icon(Icons.check)
                  : null,
              onTap: () {
                _showPaymentMethodDialog('Credit Card');
              },
            ),
            ListTile(
              title: Text('Debit Card'),
              leading: Icon(Icons.credit_card),
              trailing:
              _selectedMethod == 'Debit Card' ? Icon(Icons.check) : null,
              onTap: () {
                _showPaymentMethodDialog('Debit Card');
              },
            ),
            ListTile(
              title: Text('PayPal'),
              leading: Icon(Icons.paypal),
              trailing:
              _selectedMethod == 'PayPal' ? Icon(Icons.check) : null,
              onTap: () {
                _showPaymentMethodDialog('PayPal');
              },
            ),
            ListTile(
              title: Text('Cash on Delivery'),
              leading: Icon(Icons.attach_money),
              trailing: _selectedMethod == 'Cash on Delivery'
                  ? Icon(Icons.check)
                  : null,
              onTap: () {
                _showPaymentMethodDialog('Cash on Delivery');
              },
            ),
            Divider(),
            ListTile(
              title: Text('Add New Card'),
              leading: Icon(Icons.add),
              onTap: () {
                // TODO: Implement add card functionality
              },
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement payment processing logic
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
