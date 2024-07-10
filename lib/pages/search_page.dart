import 'package:flutter/material.dart';
import 'package:pharmacy_app/model/medicine.dart';
import 'package:pharmacy_app/model/pharmacy.dart';
import 'package:pharmacy_app/pages/medicine_page.dart';
import 'package:pharmacy_app/pages/home_page.dart';

class MedicineSearchPage extends StatefulWidget {
  @override
  _MedicineSearchPageState createState() => _MedicineSearchPageState();
}

class _MedicineSearchPageState extends State<MedicineSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Medicine> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Medicine'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to HomePage when back arrow is clicked
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(), // Navigate to your HomePage
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchResults = _searchMedicine(value);
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final medicine = _searchResults[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to MedicineDetailsPage when a ListTile is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MedicinePage(food: medicine),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(medicine.name),
                    subtitle: Text(medicine.description),
                    leading: Image.asset(medicine.imageUrl),
                    trailing: Text('\$${medicine.price.toString()}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Medicine> _searchMedicine(String query) {
    // Call the searchMedicine function from your Restaurant class
    return Pharmacy().searchMedicine(query);
  }
}
