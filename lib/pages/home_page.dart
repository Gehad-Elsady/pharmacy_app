import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/my_drawer.dart';
import 'package:pharmacy_app/components/my_medicine_tile.dart';
import 'package:pharmacy_app/components/my_sliver_app_bar.dart';
import 'package:pharmacy_app/components/my_tap_bar.dart';
import 'package:pharmacy_app/model/medicine.dart';
import 'package:pharmacy_app/model/pharmacy.dart';
import 'package:pharmacy_app/pages/medicine_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(length: MedicineCategore.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Medicine> _filterMenuByCategory(
      MedicineCategore category, List<Medicine> fullmenu) {
    return fullmenu.where((medicine) => medicine.categore == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Medicine> fullmenu) {
    return MedicineCategore.values.map((category) {
      List<Medicine> categoryMenu = _filterMenuByCategory(category, fullmenu);
      return GridView.count(
        crossAxisCount: 4, // Number of items in each row
        crossAxisSpacing: 8.0, // Spacing between columns
        mainAxisSpacing: 8.0, // Spacing between rows
        children: categoryMenu.map((food) {
          return Card(
            elevation: 2,
            child: SingleChildScrollView(
              child: MedicineTile(
                food: food,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicinePage(food: food),
                    ),
                  );
                },
              ),
            ),
          );
        }).toList(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTapBar(tabController: _tabController),
          )
        ],
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<Pharmacy>(
                builder: (context, restaurant, child) => TabBarView(
                      controller: _tabController,
                      children: getFoodInThisCategory(restaurant.menu),
                    ))),
      ),
    );
  }
}
