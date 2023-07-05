/*import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '1. Introduction',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Welcome to our app. By using our app, you agree to these terms and conditions.',
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                '2. User Conduct',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'You agree to use the app for lawful purposes only and in a manner that does not infringe the rights of, or restrict or inhibit the use and enjoyment of, the app by any third party.',
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                '3. Limitation of Liability',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'We are not liable for any indirect or consequential loss or damage, or for any loss of data, profit, revenue or business, arising out of or in connection with the use of our app.',
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                '4. Governing Law',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'These terms and conditions are governed by and construed in accordance with the laws of your country.',
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                '5. Contact Us',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'If you have any questions about these terms and conditions, please contact us at info@homebakersapp.com.',
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Terms and Conditions'),
        ),
        body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Welcome to Baked! We are committed to providing you with the best possible experience.'
        ' By using our app, you agree to the following terms and conditions:',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'Food Safety and Quality',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    ),
    ),
    SizedBox(height: 16.0),
    Text("Our app provides a platform for home bakers to sell their baked goods to customers. We take food safety and quality very seriously and require all home bakers to comply with local health regulations and standards."

      ' When ordering food through our app, it is important to ensure that you are aware of any food allergies you may have and to communicate this information when placing your order. We are not responsible for any allergic reactions that may occur as a result of consuming food purchased through our app.',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'Pricing and Payment',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'The price of each item is clearly displayed, including any applicable taxes and delivery fees. We use a secure and reliable payment process to ensure that your transactions are safe and secure.',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'Delivery',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'We provide clear instructions for delivery of the baked goods, including the delivery location, estimated delivery time, and any additional fees for delivery. We use trusted delivery partners to ensure that your items arrive on time and in good condition.',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'Refunds and Returns',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'If you encounter any quality issue with the product or are unhappy with your purchase for any other reason, please contact us within 24 hours of delivery. We may request proof of the issue, such as photographs or a description of the problem. Once we have verified the issue, we will either provide a refund or a replacement product, depending on your preference and the availability of the product.'

      'Please note that we cannot provide refunds or replacements if the issue is due to customer error, such as providing incorrect delivery information or not being available to receive the delivery at the agreed-upon time. We also cannot provide refunds or replacements if the issue is not genuine or if the product has already been consumed.',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
      SizedBox(height: 16.0),
      Text(
        'Intellectual Property',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      SizedBox(height: 16.0),
      Text(
        'All content on our app, including text, graphics, logos, images, and software, is the property of our app and is protected by copyright and other intellectual property laws. You may not use or reproduce any of this content without our express written permission.',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      SizedBox(height: 16.0),
      Text(
        'Changes to Terms and Conditions',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      SizedBox(height: 16.0),
      Text(
        'We reserve the right to modify these terms and conditions at any time. Any changes will be effective immediately upon posting to our app. By continuing to use our app after the changes are posted, you agree to be bound by the revised terms and conditions.',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    ],
    ),
        ),
    );
  }
}



