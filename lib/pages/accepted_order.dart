import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_app/pages/home_page.dart';
import 'package:pharmacy_app/services/auth/auth_services.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  late String? currentUserEmail = '';
  late List<Map<String, dynamic>> orders = [];

  @override
  void initState() {
    super.initState();
    fetchCurrentUser();
  }

  void fetchCurrentUser() async {
    final _authService = AuthServices();
    User? currentUser = await _authService.getCurrentUser();
    try {
      if (currentUser != null) {
        setState(() {
          currentUserEmail = currentUser.email ?? '';
          fetchOrders(currentUserEmail!);
        });
      }
    } catch (e) {
      print('Error getting current user: $e');
    }
  }

  void fetchOrders(String email) async {
    try {
      // Get Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Query Firestore to get orders
      QuerySnapshot querySnapshot = await firestore
          .collection('Pharmacy')
          .where('userId', isEqualTo: email)
          .get();

      // Extract data from documents and store it in the orders list
      List<Map<String, dynamic>> fetchedOrders = [];
      querySnapshot.docs.forEach((document) {
        // Cast document data to Map<String, dynamic>
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        // Check if document data is not null before adding it to the list
        if (data.isNotEmpty) {
          // Add orderId field using document ID
          data['orderId'] = document.id;
          fetchedOrders.add(data);
        }
      });

      setState(() {
        orders = fetchedOrders;
      });
    } catch (e) {
      print('Error fetching orders: $e');
    }
  }

  void cancelOrder(String orderId) async {
    try {
      // Get Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Delete the order from Firestore
      await firestore.collection('Pharmacy').doc(orderId).delete();

      // Fetch orders again to reflect changes
      fetchOrders(currentUserEmail!);
    } catch (e) {
      print('Error canceling order: $e');
    }
  }

  Future<void> showCancelConfirmationDialog(String orderId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cancel Order'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to cancel this order?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                cancelOrder(orderId);
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
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
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          },
        ),
        title: Text('My Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          // Extract order details
          Map<String, dynamic> order = orders[index];
          List<dynamic> items = order['items'];
          String orderId = order['orderId']; // Use orderId from the order map

          // Calculate total price of the order
          double totalPrice = 0;
          for (var item in items) {
            totalPrice += item['price'];
          }

          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ${index + 1}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('Address: ${order['address']}'),
                  Text('City: ${order['city']}'),
                  Text('Governorate: ${order['governorate']}'),
                  Text('Order State: ${order['order_state']}'),
                  Text('Phone: ${order['phone']}'),
                  SizedBox(height: 8.0),
                  Text(
                    'Items:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Column(
                    children: items.map((item) {
                      return ListTile(
                        title: Text(item['name']),
                        subtitle: Text('Price: ${item['price']}'),
                        leading: Image.asset(
                          item['imageUrl'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      showCancelConfirmationDialog(orderId);
                    },
                    child: Text('Cancel Order'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
