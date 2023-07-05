import 'package:flutter/material.dart';

import 'offer.dart';
import 'wishlist.dart';

void main() {
  runApp(MaterialApp(home: CartPage(),));
}


class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(
      productImage: 'assets/cake.png',
      productName: 'Chocolate Cake',
      quantity: 1,
      price: 210.0,
    ),
    CartItem(
      productImage: 'assets/ccc.jpg',
      productName: 'Vanilla Pastry',
      quantity: 2,
      price: 155.0,
    ),
    CartItem(
      productImage: 'assets/cookie.png',
      productName: 'Chocolate Chip Cookie',
      quantity: 3,
      price: 172.0,
    ),
  ];

  void increaseQuantity(CartItem item) {
    setState(() {
      item.quantity++;
    });
  }

  void deleteItem(CartItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm'),
          content: Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  cartItems.remove(item);
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
        title: Text('Your Cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Row(
            children: [Text("Wishlist"),
              SizedBox(width: 2.0,),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return WishlistPage();
                    },));
                  // Navigate to the wishlist page
                },
              ),

            ],
          ),
        ],
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('Your cart is empty.'))
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          CartItem item = cartItems[index];
          return ListTile(
            leading: Image.asset(item.productImage),
            title: Text(item.productName),
            subtitle: DropdownButton(
              value: item.quantity,
              items: List.generate(10, (i) => i + 1)
                  .map((quantity) => DropdownMenuItem(
                value: quantity,
                child: Text('$quantity'),
              ))
                  .toList(),
              onChanged: (quantity) {
                setState(() {
                  item.quantity = quantity!;
                });
              },
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => deleteItem(item),
            ),
          );
        },
      ),
      bottomNavigationBar: cartItems.isNotEmpty
          ? Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \Rs${cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity))}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              child: Text('Checkout'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OfferSearch();
                },));
              },
            ),
          ],
        ),
      )
          : null,
    );
  }
}

class CartItem {
  final String productImage;
  final String productName;
  int quantity;
  final double price;

  CartItem({
    required this.productImage,
    required this.productName,
    required this.quantity,
    required this.price,
  });
}
