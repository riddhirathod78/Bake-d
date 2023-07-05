import 'package:flutter/material.dart';

import 'payment.dart';

void main() {
  runApp(MaterialApp(home:  OfferSearch()));
}

class Offer {
  final String name;
  final IconData iconData;
  bool isSelected;

  Offer(this.name,this.iconData, {this.isSelected = false});
}

class OfferSearch extends StatefulWidget {
  const OfferSearch({Key? key}) : super(key: key);

  @override
  _OfferSearchState createState() => _OfferSearchState();
}

class _OfferSearchState extends State<OfferSearch> {
  late List<Offer> _offers = [
    Offer('-10% off on your first order',  Icons.currency_rupee),
    Offer('-5% off shipping fee',  Icons.electric_bike_outlined),
    Offer('Buy 3 get 1 free on Brownies',  Icons.shopping_bag_outlined),
    Offer('-10% for E-wallet',  Icons.wallet_outlined),
    Offer('-20% for bill over 1000 Rs', Icons.percent_rounded),
    Offer('FreeShip',  Icons.bike_scooter_rounded),
  ];

  List<Offer> _filteredOffers = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredOffers = _offers;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterOffers(String query) {
    List<Offer> filteredList = [];
    filteredList.addAll(_offers.where((offer) => offer.name.toLowerCase().contains(query.toLowerCase())));
    setState(() {
      _filteredOffers = filteredList;
    });
  }

  void _onOfferSelected(Offer offer) {
    setState(() {
      offer.isSelected = !offer.isSelected;
    });
  }

  void _useOffers() {
    List<Offer> selectedOffers = _offers.where((offer) => offer.isSelected).toList();
    String message = 'You have used the following offers: ';
    selectedOffers.forEach((offer) => message += '${offer.name}, ');
    message = message.substring(0, message.length - 2) + '.';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Offers Used'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offers'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for offers',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _filterOffers('');
                  },
                ),
              ),
              onChanged: (value) {
                _filterOffers(value);
              },
            ),
          ),
          Expanded(
            child: Card(
              child: ListView.builder(
                itemCount: _filteredOffers.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                      title: Row(
                        children: [
                          Icon(_filteredOffers[index].iconData),
                          SizedBox(width: 10.0),
                          Text(_filteredOffers[index].name),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(" "),
                      ),
                      value: _filteredOffers[index].isSelected,
                      onChanged: (value) {
                        _onOfferSelected(_filteredOffers[index]);
                        value:
                        _filteredOffers[index].isSelected;
                        onChanged:
                            (value) {
                          _onOfferSelected(_filteredOffers[index]);
                        };
                      }
                  );
                }
                ,
              ),
            ),
          ),
          SizedBox(height: 40.0,),
          ElevatedButton(
            child: Text('Checkout'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PaymentScreen(totalAmount: 1120.0,);
              },));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _useOffers,
        label: Text('Use Now'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }}
