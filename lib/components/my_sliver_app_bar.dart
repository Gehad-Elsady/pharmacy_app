import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/pages/accepted_order.dart';
import 'package:pharmacy_app/pages/cart_page.dart';
import 'package:pharmacy_app/pages/search_page.dart';
import 'package:pharmacy_app/services/auth/auth_services.dart';

class MySliverAppBar extends StatefulWidget {
  final Widget title;

  const MySliverAppBar({required this.title, Key? key}) : super(key: key);

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  // ignore: unused_field
  int _currentPage = 0;
  final List<String> _imageUrls = [
    "images/appbar1.png",
    "images/appbar2.png",
    "images/appbar3.png",
    "images/appbar4.png",
    "images/appbar5.png",
  ];

  final GlobalKey _notificationButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 450,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          key: _notificationButtonKey,
          onPressed: () {
            showWelcomeMenu(context);
          },
          icon: Stack(
            children: [
              const Icon(Icons.notifications_active_rounded),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Notifications')
                    .doc(currentUserEmail)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox
                        .shrink(); // Return an empty sized box while loading
                  } else if (snapshot.hasError) {
                    return const SizedBox
                        .shrink(); // Return an empty sized box if there's an error
                  } else if (snapshot.hasData && snapshot.data!.exists) {
                    // If data exists, return a green dot indicating new notifications
                    return Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green, // Change color as desired
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox
                        .shrink(); // Return an empty sized box if no notifications
                  }
                },
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          },
        ),
        IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedicineSearchPage(),
                  ));
            },
            icon: Icon(
              Icons.search,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyOrders(),
                  ));
            },
            icon: Icon(Icons.shopping_bag))
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      title: const Text("Gte well soon 😘"),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: CarouselSlider.builder(
          itemCount: _imageUrls.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              padding: const EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              child: Image.asset(_imageUrls[index], fit: BoxFit.fill),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
        title: widget.title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }

  void showWelcomeMenu(BuildContext context) {
    final RenderBox button =
        _notificationButtonKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          button.localToGlobal(Offset.zero, ancestor: overlay),
          button.localToGlobal(button.size.bottomLeft(Offset.zero),
              ancestor: overlay),
        ),
        Offset.zero & overlay.size,
      ),
      items: [
        PopupMenuItem(
          // ignore: sort_child_properties_last
          child: SizedBox(
            width: 1000, // Adjust width as needed
            height: 200, // Adjust height as needed
            child: SingleChildScrollView(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Notifications')
                    .doc(currentUserEmail)
                    .snapshots(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Center(
                      child: Text('there is no notifications'),
                    );
                  }

                  var user = snapshot.data!.data() as Map<String, dynamic>;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.teal[200],
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 50,
                              child: Center(child: Text('${user['message']}'))),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          enabled: false,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    // Fetch the current user's details when the widget initializes
    fetchCurrentUser();
  }

  void fetchCurrentUser() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _authService = AuthServices();
    // ignore: await_only_futures
    User? currentUser = await _authService.getCurrentUser();
    try {
      if (currentUser != null) {
        setState(() {
          // Update the email variable with the current user's email
          currentUserEmail = currentUser.email;
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error getting current user: $e');
    }
  }

  String? currentUserEmail;
}
