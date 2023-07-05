import 'package:flutter/material.dart';

import 'cart.dart';

void main() {
  runApp(MaterialApp(home: WishlistPage(),));
}

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<Map<String, dynamic>> items = [
    {
      "id": 1,
      "name": "Product 1",
      "description": "This is product 1",
      //"image": "assets/strawberry.jpg",
      "image": "https://via.placeholder.com/150",
      "isAddedToCart": false,
    },
    {
      "id": 2,
      "name": "Product 2",
      "description": "This is product 2",
      //"image": "assets/lilac.jpg",
      "image": "https://via.placeholder.com/150",
      "isAddedToCart": false,
    },
    {
      "id": 3,
      "name": "Product 3",
      "description": "This is product 3",
      //"image": "assets/cookie.png",
      "image": "https://via.placeholder.com/150",
      "isAddedToCart": false,
    },
    {
      "id": 4,
      "name": "Product 4",
      "description": "This is product 3",
      //"image": "assets/crepe.jpg",
      "image": "https://via.placeholder.com/150",
      "isAddedToCart": false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Wishlist')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var item in items)
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item['image'],
                          height: 100,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(item['description']),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (item['isAddedToCart'])
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return CartPage();
                                    },));
                                  },
                                  icon: Icon(Icons.shopping_cart),
                                  label: Text('View Cart'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                  ),
                                )
                              else
                                ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      item['isAddedToCart'] = true;
                                    });
                                  },
                                  icon: Icon(Icons.add_shopping_cart),
                                  label: Text('Add to Cart'),
                                ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Confirm'),
                                        content: Text('Are you sure you want to remove this from your wishlist?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); // dismiss dialog
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                items.removeWhere((element) => element['id'] == item['id']);
                                              });
                                              Navigator.of(context).pop(); // dismiss dialog
                                              // perform deletion logic here
                                            },
                                            child: Text('Delete'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(Icons.delete),
                              ),


                              /*IconButton(
                                onPressed: () {
                                  setState(() {
                                    items.removeWhere((element) => element['id'] == item['id']);
                                  });
                                },
                                icon: Icon(Icons.delete),
                                color: Colors.black87,
                              ),*/
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}












