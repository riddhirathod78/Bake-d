import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: OrderHistoryPage()));
}

class Order {
  final String name;
  final double price;
  final String deliveryAddress;
  final String photoAsset;
  final double rating;

  Order({
    required this.name,
    required this.price,
    required this.deliveryAddress,
    required this.photoAsset,
    required this.rating,
  });
}

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  List<Order> _orders = [
    Order(
      name: 'Vanilla Cake',
      price: 450.0,
      deliveryAddress: '12 Pimple Gurav, Pune',
      photoAsset: 'assets/11o.png',
      rating: 4.5,
    ),
    Order(
      name: 'Chocolate Cake',
      price: 500.0,
      deliveryAddress: 'Jivraj Park, Ahemdabad',
      photoAsset: 'assets/12o.jpeg',
      rating: 5.0,
    ),
    Order(
      name: 'Strawberry Cake',
      price: 550.0,
      deliveryAddress: 'Kesar Nagar, Adipur',
      photoAsset: 'assets/13o.jpeg',
      rating: 4.8,
    ),
  ];

  List<Order> _filteredOrders = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredOrders = _orders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _filteredOrders = _orders
                      .where((order) =>
                  order.name
                      .toLowerCase()
                      .contains(value.toLowerCase()) ||
                      order.deliveryAddress
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                  hintText: 'Search by cake name or delivery address'),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Orders',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _filteredOrders = _orders;
                    });
                  },
                  child: Text('View All'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredOrders.length,
                itemBuilder: (BuildContext context, int index) {
                  final order = _filteredOrders[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                order.photoAsset,
                                height: 80.0,
                                width: 67.0,
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order.name,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(order.price.toString()),
                                  Text(order.deliveryAddress),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  // Implement reorder functionality
                                },
                                child: Text('Reorder'),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Rating:',
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: List.generate(
                                  order.rating.toInt(),
                                      (index) => Icon(Icons.star, color: Colors.yellow),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
