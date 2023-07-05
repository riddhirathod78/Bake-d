import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: NotificationPage(),));
}

//import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, dynamic>> notifications = [
    {      'id': 1,
      'title': ' Hurray! 10% off on Cupcakes',
      'description': '10%  off on all Cupcakes!',
      'time': DateTime.now(),
      'isRead': false,    },
    {      'id': 2,
      'title': 'Order Delivered',
      'description': 'Your order has been delivered.',
      'time': DateTime.now().subtract(Duration(days: 1)),
      'isRead': true,    },
    {      'id': 3,
      'title': 'Order Cancelled',
      'description': 'Your order has been cancelled.',
      'time': DateTime.now().subtract(Duration(days: 2)),
      'isRead': true,    },  ];

  List<Map<String, dynamic>> todayNotifications() {
    return notifications.where((n) => n['time'].day == DateTime.now().day).toList();
  }

  List<Map<String, dynamic>> olderNotifications() {
    return notifications.where((n) => n['time'].day < DateTime.now().day).toList();
  }

  void markAsRead(int id) {
    setState(() {
      notifications = notifications.map((n) {
        if (n['id'] == id) {
          n['isRead'] = true;
        }
        return n;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Notifications')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(0.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  if (todayNotifications().isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ...todayNotifications().map((n) => NotificationItem(
                    notification: n,
                    onMarkAsRead: () => markAsRead(n['id']),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationDetailsPage(notification: n),
                      ),
                    ),
                  )),
                  if (olderNotifications().isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Older Notifications',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ...olderNotifications().map((n) => NotificationItem(
                    notification: n,
                    onMarkAsRead: () => markAsRead(n['id']),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationDetailsPage(notification: n),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final Map<String, dynamic> notification;
  final void Function() onMarkAsRead;
  final void Function() onTap;

  NotificationItem({
    required this.notification,
    required this.onMarkAsRead,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(
        leading: Icon(
          Icons.notifications,
          color: notification['isRead'] ? Colors.grey : Colors.red,
        ),
        title: Text(
          notification['title'],
          style: TextStyle(
            fontWeight: notification['isRead'] ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Text(
          notification['description'],
          style: TextStyle(
            color: Colors.grey,
            fontWeight: notification['isRead'] ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        trailing: notification['isRead']
            ? null
            : InkWell(
          onTap: onMarkAsRead,
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.circle,
              color: Colors.white,
              size: 10.0,
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

class NotificationDetailsPage extends StatelessWidget {
  final Map<String, dynamic> notification;

  NotificationDetailsPage({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Details'),
      ),
      body: Center(
        child: Text(notification['description']),
      ),
    );
  }
}



