import 'package:flutter/material.dart';
import 'package:pharmacy_app/model/medicine.dart';

class MyTapBar extends StatelessWidget {
  final TabController tabController;
  const MyTapBar({Key? key, required this.tabController}) : super(key: key);

  List<Tab> _buildCategoryTabs(BuildContext context) {
    return MedicineCategore.values.map((category) {
      return Tab(
        text: category.toString().split(".").last,
        // Customize tab text style here
        // textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Add decoration to the container
        color: Colors.cyan[200], // Example color
        borderRadius: BorderRadius.circular(10.0), // Example border radius
      ),
      child: TabBar(
        // Customize TabBar properties
        // isScrollable: true,
        controller: tabController,
        tabs: _buildCategoryTabs(context),
        labelColor: Colors.black, // Text color for selected tab
        unselectedLabelColor: Colors.black, // Text color for unselected tabs
        indicator: BoxDecoration(
          // Indicator decoration
          color: Colors.teal.withOpacity(0.8), // Example color
          borderRadius: BorderRadius.circular(10.0), // Example border radius
        ),
      ),
    );
  }
}
