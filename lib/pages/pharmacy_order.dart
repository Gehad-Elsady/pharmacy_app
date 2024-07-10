import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharmacy_app/pages/orders_page.dart';
import 'package:pharmacy_app/services/auth/auth_services.dart';

class PharmacyOrderPage extends StatefulWidget {
  const PharmacyOrderPage({Key? key}) : super(key: key);

  @override
  State<PharmacyOrderPage> createState() => _PharmacyOrderPageState();
}

class _PharmacyOrderPageState extends State<PharmacyOrderPage> {
  late String? currentUserEmail = '';
  late FirebaseFirestore _firestore;
  late CollectionReference _pharmacyCollection;

  @override
  void initState() {
    super.initState();
    fetchCurrentUser();
    _firestore = FirebaseFirestore.instance;
    _pharmacyCollection = _firestore.collection('Pharmacy');
  }

  void fetchCurrentUser() async {
    final _authService = AuthServices();
    User? currentUser = await _authService.getCurrentUser();
    try {
      if (currentUser != null) {
        setState(() {
          currentUserEmail = currentUser.email;
        });
      }
    } catch (e) {
      print('Error getting current user: $e');
    }
  }

  void cancelOrder(String documentId) async {
    try {
      // Get the userId from the Pharmacy document
      DocumentSnapshot pharmacyDocument =
          await _pharmacyCollection.doc(documentId).get();
      String userId = pharmacyDocument['userId'];

      // Update the Pharmacy document
      await _pharmacyCollection.doc(documentId).update({
        'businessId': FieldValue.delete(),
        'order_state': 'pending',
      });

      // Update the Notifications collection
      await _firestore.collection('Notifications').doc(userId).set({
        'userId': userId,
        'message':
            'Your order has been canceled the order referred to pending orders.',
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Order cancelled successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      print('Error cancelling order: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to cancel order. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to HomePage when back arrow is clicked
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrdersPage(), // Navigate to your HomePage
              ),
            );
          },
        ),
        title: Text('Pharmacy Orders'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _pharmacyCollection
            .where('businessId', isEqualTo: currentUserEmail)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No orders found.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var document = snapshot.data!.docs[index];
              var data = document.data() as Map<String, dynamic>;
              var documentId = document.id;
              // Access fields like address, city, etc.
              var address = data['address'];
              var city = data['city'];
              // Access the items list
              var items = data['items'] as List<dynamic>;
              // Iterate over items list
              var itemList =
                  items.map((item) => item as Map<String, dynamic>).toList();
              // Create ExpansionTile for each order
              return Card(
                margin: EdgeInsets.all(8.0),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ExpansionTile(
                  title: Text(
                    'Order #$index',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  leading: Icon(Icons.shopping_cart),
                  children: [
                    ListTile(
                      title: Text(
                        'Address:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(address),
                    ),
                    ListTile(
                      title: Text(
                        'City:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(city),
                    ),
                    // Display items
                    ...itemList
                        .map((item) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(
                                    'Item: ${item['name']}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Price: ${item['price']}'),
                                      if (item.containsKey('imageUrl'))
                                        Image.network(
                                          item['imageUrl'],
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                    ],
                                  ),
                                ),
                                Divider(),
                              ],
                            ))
                        .toList(),
                    SizedBox(height: 10),
                    // Cancel button
                    ElevatedButton(
                      onPressed: () {
                        cancelOrder(documentId);
                      },
                      child: Text('Cancel Order'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
