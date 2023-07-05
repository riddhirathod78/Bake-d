import 'package:flutter/material.dart';

import 'cart.dart';
import 'feedback.dart';
import 'notificatiins.dart';
import 'order history.dart';
import 'profile.dart';
import 'search.dart';
import 'wishlist.dart';


void main() {
  runApp(MaterialApp(home: BakedHomePage()));
}

class BakedHomePage extends StatefulWidget {
  const BakedHomePage({Key? key}) : super(key: key);

  @override
  _BakedHomePageState createState() => _BakedHomePageState();
}

class _BakedHomePageState extends State<BakedHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baked'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return search();
              },));
              // Navigate to search page
            },
          ),

          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NotificationPage();
              },));
              // Navigate to notifications page
            },
          ),


        ],

      ),
      drawer: const BakedDrawer(),
      body: SingleChildScrollView(
        child: Column(

        ),
      ),
    );
  }
}

class BakedDrawer extends StatelessWidget {
  const BakedDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Baked',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Wishlist'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return WishlistPage();
              },));
              // Navigate to home page
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('My Cart'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CartPage();
              },));
              // Navigate to cart page
            },
          ),
          ListTile(
            leading: Icon(Icons.notification_important),
            title: Text('Notifications'),
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NotificationPage();
              },));
              // Navigate to cart page
            },
          ),

          ListTile(
            leading: Icon(Icons.notification_important),
            title: Text('Edit Profile'),
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditProfilePage();
              },));
              // Navigate to cart page
            },
          ),


          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Order History'),
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OrderHistoryPage();
              },));
              // Navigate to cart page
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Feedback'),
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DeliveryRatingPage();
              },));
              // Navigate to cart page
            },
          ),


        ],
      ),
    );
  }
}

