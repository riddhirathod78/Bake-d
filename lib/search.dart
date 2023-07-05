import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: search() ,));
}

class search extends StatelessWidget {
  const search({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const UserListScreen()
    );
  }
}


class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  final List<Map<String, dynamic>> _allUsers = [
    {
      "image":
      "https://img.freepik.com/free-photo/sponge-cake-with-strawberries-top_144627-45517.jpg?w=996&t=st=1679018117~exp=1679018717~hmac=d9da7bfaa9b6d4538d5c39d718e2ae6c43f7d1bcf219b240979c00b47d1a7aea",
      "id": 1,
      "name":"Bakers Deligths",
      "des": "Cake",
    },
    {
      "id": 2,
      "name": "Divines Cake ",
      "des": "Cake",
      "image":
      "https://img.freepik.com/free-photo/chocolate-cake-with-chocolate-sprinkles_144627-8998.jpg?w=1060&t=st=1679018183~exp=1679018783~hmac=6bbef3293ad19a1c51c0e2420399df7fa6af4397cd06428485b154ccd3580be1",
    },
    {
      "id": 3,
      "name": "BH Bakers",
      "des": "Cake ",
      "image":
      "https://img.freepik.com/premium-photo/cake-with-white-cream-chocolate-drips-pomegranate-nuts-chocolate-decor_199620-5923.jpg?w=1060"    },
    {
      "id": 4,
      "name": "Raj Kamal ",
      "des": "Cake",
      "image":
      "https://img.freepik.com/free-photo/slice-toasted-bread-with-heart-shape_23-2148154440.jpg?w=1060&t=st=1678967277~exp=1678967877~hmac=f32a350129be7fffe4de1c469f1b162e4530215fddce4955f202592eb2e44995",
    },
    {
      "id": 5,
      "name": "Mehta Bakers ",
      "des": "Cake",
      "image":
      "https://img.freepik.com/free-photo/front-view-sweet-chocolate-cake_23-2148834059.jpg?t=st=1679018328~exp=1679018928~hmac=bea3d44490e4b115e7bd58847c2a41eb5aa596b18f6d66e4b8bcc505dde890e7",
    },
    {
      "id": 6,
      "name": "Deno James",
      "des": "pastry ",
      "image":
      "https://img.freepik.com/premium-photo/concept-tasty-dessert-with-tiramisu-cake-space-text_185193-77838.jpg?w=1060"
    },
    {
      "id": 7,
      "name": "Kaviraj Bakers ",
      "des": "CupCake",
      "image":
      "https://img.freepik.com/free-photo/front-view-cupcake-with-copy-space_23-2148769225.jpg?w=1060&t=st=1679018463~exp=1679019063~hmac=7278128a4a549dd3737b0fb3e072bb7da3517dac6500804d9a48c0c4be0d2c0e",
    },
    {
      "id": 8,
      "name": "Raja Bakers Pastry",
      "des": " Pastry",
      "image":
      "https://img.freepik.com/premium-photo/concept-tasty-dessert-with-tiramisu-cake-space-text_185193-77838.jpg?w=1060",
    },
    {
      "id": 9,
      "name": "Cavers Bakers ",
      "des": "Pastry" ,
      "image":
      "https://img.freepik.com/premium-photo/concept-tasty-dessert-with-tiramisu-cake-space-text_185193-77838.jpg?w=1060"
    },
    {
      "id": 10,
      "name": "Becky " ,
      "des": "Cake",
      "image":
      "https://img.freepik.com/premium-photo/concept-tasty-dessert-with-tiramisu-cake-space-text_185193-77838.jpg?w=1060",
    },
  ];


  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["des"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Homebakers Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          TextField(
            onChanged: (value) => _runFilter(value),
            decoration: InputDecoration(
              contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              hintText: "Search",
              suffixIcon: const Icon(Icons.search),
              // prefix: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          Expanded(
            child: _foundUsers.isNotEmpty
                ? ListView.builder(
              itemCount: _foundUsers.length,
              itemBuilder: (context, index) => Card(
                elevation: 1,
                margin: const EdgeInsets.symmetric(vertical: 2),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                    NetworkImage(_foundUsers[index]['image']),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(_foundUsers[index]['name']),
                  subtitle: Text('${_foundUsers[index]["des"]}'),
                ),
              ),
            )
                : const Text(
              'No results found Please try with diffrent search',
              style: TextStyle(fontSize: 24),
            ),
          ),

        ],),
      ),
    );

  }
}
