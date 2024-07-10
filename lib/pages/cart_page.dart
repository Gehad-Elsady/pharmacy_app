import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/my_button.dart';
import 'package:pharmacy_app/model/pharmacy.dart';
import 'package:pharmacy_app/services/auth/auth_services.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late String? currentUserEmail = '';

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
        });
      }
    } catch (e) {
      print('Error getting current user: $e');
    }
  }

  void deleteCartItem(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection("Orders")
          .doc(currentUserEmail)
          .collection("Items")
          .doc(documentId)
          .delete();
    } catch (e) {
      print('Error deleting item: $e');
    }
  }

  void placeOrderAndSaveUserDataToFirestore() async {
    try {
      // Retrieve user data
      DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUserEmail!)
          .get();

      // Check if user data exists
      if (userDataSnapshot.exists) {
        // Extract user data
        String? city = userDataSnapshot.get('city');
        String? governorate = userDataSnapshot.get('governorate');
        String? address = userDataSnapshot.get('address');
        String? phone = userDataSnapshot.get('phone');

        // Check if any of the user data fields are null
        if (city == null ||
            governorate == null ||
            address == null ||
            phone == null) {
          // Show message to update profile with missing information
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                "Please update your profile with your address and phone",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          );
          return; // Exit the function
        }

        // Get the user's cart items
        QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
            .collection("Orders")
            .doc(currentUserEmail!)
            .collection("Items")
            .get();

        // Check if cart is empty
        if (cartSnapshot.docs.isEmpty) {
          // Show message that there are no items in the cart
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                "No Items in Cart",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          );
          return; // Exit the function
        }

        // Prepare a list to store the cart items
        List<Map<String, dynamic>> items = [];

        // Loop through the cart items and add them to the list
        for (DocumentSnapshot document in cartSnapshot.docs) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          items.add(data);
        }

        // Save the items to the "Pharmacy" collection under a document named "goog" and a subcollection named "items"
        await FirebaseFirestore.instance.collection("Pharmacy").doc().set({
          'userId': currentUserEmail!,
          'items': items,
          'address': address,
          'city': city,
          'governorate': governorate,
          'order_state': 'pending',
          'phone': phone
        });

        // Clear the user's cart after placing the order
        await FirebaseFirestore.instance
            .collection("Orders")
            .doc(currentUserEmail!)
            .collection("Items")
            .get()
            .then((snapshot) {
          // Delete items from "Orders" collection
          for (DocumentSnapshot ds in snapshot.docs) {
            ds.reference.delete();
          }
        });

        // Save items to the "History" collection
        await FirebaseFirestore.instance.collection("History").doc().set({
          'userId': currentUserEmail!,
          'items': items,
          'address': address,
          'city': city,
          'governorate': governorate,
          'order_state': 'pending',
          'phone': phone
        });

        // Show order placed dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Your Order has been placed 🚚😍",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        );
      }
    } catch (e) {
      print('Error placing order: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Pharmacy>(
      builder: (context, restaurant, child) {
        // ignore: unused_local_variable
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'Cart   🛒',
              style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Colors.teal[900],
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                          "Are you sure you want to clear the cart?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            try {
                              QuerySnapshot cartSnapshot =
                                  await FirebaseFirestore.instance
                                      .collection("Orders")
                                      .doc(currentUserEmail!)
                                      .collection("Items")
                                      .get();
                              for (DocumentSnapshot document
                                  in cartSnapshot.docs) {
                                await document.reference.delete();
                              }
                            } catch (e) {
                              print('Error clearing cart: $e');
                            }
                          },
                          child: Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Orders')
                      .doc(currentUserEmail!)
                      .collection('Items')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text(
                          "Your Cart is Empty......🥺",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                    // Render the list of items if the cart is not empty
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = snapshot.data!.docs[index];
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        String documentId = document.id;
                        String name = data['name'];
                        double price = data['price'];
                        String imageUrl = data['imageUrl'];
                        return SizedBox(
                          height: 150,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      // ignore: unnecessary_null_comparison
                                      image: imageUrl != null
                                          ? AssetImage(imageUrl)
                                          : AssetImage(
                                              'assets/placeholder_image.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        title: Text(
                                          name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        subtitle: Text(
                                          'Price: \$${price.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              deleteCartItem(documentId);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Orders")
                    .doc(currentUserEmail)
                    .collection("Items")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...');
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  double totalPrice = 0;
                  for (DocumentSnapshot document in snapshot.data!.docs) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    double price = data['price'] ?? 0;
                    totalPrice += price;
                  }
                  return Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 12),
                        Text(
                          "Total :",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "\$" + totalPrice.toStringAsFixed(2),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.teal[900]),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyButton(
                "Place the order",
                ontap:
                    placeOrderAndSaveUserDataToFirestore, // Call the function to place order and save to Firestore
                icon: Icons.shopify_sharp,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "To place an order, please ensure your profile is updated with your address, city, and governorate on the profile page.",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }
}
