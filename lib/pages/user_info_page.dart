import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharmacy_app/components/my_button.dart';
import 'package:pharmacy_app/components/my_textfilde.dart';
import 'package:pharmacy_app/components/my_user_carde.dart';
import 'package:pharmacy_app/pages/home_page.dart';
import 'package:pharmacy_app/pages/orders_page.dart';
import 'package:pharmacy_app/services/auth/auth_services.dart';

class UsersInfo extends StatefulWidget {
  const UsersInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<UsersInfo> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<UsersInfo> {
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController phone = TextEditingController();
  late String? currentUserEmail;

  // Lists of governorates and cities
  List<String> governorates = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Aswan',
    'Assiut'
  ];
  Map<String, List<String>> cities = {
    'Cairo': [
      'Nasr City',
      'Maadi',
      'Heliopolis',
      'Dokki',
      'Shubra',
      'El Mataria',
      'Heliopolis',
      'Musturud',
      'Fustat',
      'Bulaq'
    ],
    'Alexandria': [
      'Smouha',
      'Miami',
      'Montaza',
      'Agami',
      'Sidi Bishr',
      'Ar-Raml'
    ],
    'Giza': [
      'Dokki',
      'Agouza',
      'Imbaba',
      'Aş Şaff',
      'Al ‘Ayyāţ',
      'Madīnat Sittah Uktūbar',
      'Awsīm'
    ],
    'Aswan': ['Aswan City', 'Kom Ombo', '	Idfū', 'Abu Simbel'],
    'Assiut': [
      'Assiut Governorate',
      "Za'toun",
      'Qusayma',
      'Tall al-Asad',
      'Jirjawy',
      'Abnuda',
      'Al-Manshīḩ',
      'Al-‘Ubayyid',
      'Al-Mu’allaqa',
      'Al-‘Āzim',
      'Al-Waddā’',
      'Al-‘Azizīya',
      'Al-‘Izz',
      'Al-Nasr',
      'Al-‘Islah',
      'Al-Sharqīyah',
      'Al-Manṣūrah',
      'Al-Hamāmī',
    ]
  };

  String selectedGovernorate = 'Assiut';
  String selectedCity = 'Al-Hamāmī';

  @override
  void initState() {
    super.initState();
    // Fetch the current user's details when the widget initializes
    fetchCurrentUser();
  }

  void fetchCurrentUser() async {
    final _authService = AuthServices();
    User? currentUser = await _authService.getCurrentUser();
    try {
      if (currentUser != null) {
        setState(() {
          // Update the email variable with the current user's email
          currentUserEmail = currentUser.email ?? '';
        });
      }
    } catch (e) {
      print('Error getting current user: $e');
    }
  }

  Future<void> _saveUserData() async {
    // Check if any field is empty
    if (name.text.isEmpty ||
        age.text.isEmpty ||
        address.text.isEmpty ||
        gender.text.isEmpty ||
        date.text.isEmpty ||
        phone.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    // Check if phone number is valid
    if (phone.text.length != 11 ||
        !(phone.text.startsWith('015') ||
            phone.text.startsWith('011') ||
            phone.text.startsWith('010') ||
            phone.text.startsWith('012'))) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a correct phone number')));
      return;
    }

    try {
      // Save user data to Firestore
      DocumentReference docRef = FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUserEmail); // Document named after current user's email
      await docRef.set({
        "name": name.text,
        "age": age.text,
        "address": address.text,
        "gender": gender.text,
        "date": date.text,
        "phone": phone.text,
        "governorate": selectedGovernorate,
        "city": selectedCity,
        "email": currentUserEmail
      });

      // Clear text fields
      name.clear();
      age.clear();
      address.clear();
      gender.clear();
      date.clear();
      phone.clear();

      // Display success message or handle UI updates if needed
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data saved successfully!')));
    } catch (error) {
      // Handle errors
      print('Error saving data to Firestore: $error');
    }
  }

  Future<void> _updateUserData() async {
    try {
      // Update user data in Firestore
      DocumentReference docRef =
          FirebaseFirestore.instance.collection("Users").doc(currentUserEmail);

      Map<String, dynamic> newData = {};

      // Check each field and add it to newData if it's not empty
      if (name.text.isNotEmpty) newData["name"] = name.text;
      if (age.text.isNotEmpty) newData["age"] = age.text;
      if (address.text.isNotEmpty) newData["address"] = address.text;
      if (gender.text.isNotEmpty) newData["gender"] = gender.text;
      if (date.text.isNotEmpty) newData["date"] = date.text;
      if (phone.text.isNotEmpty) newData["phone"] = phone.text;
      if (selectedGovernorate.isNotEmpty)
        newData["governorate"] = selectedGovernorate;
      if (selectedCity.isNotEmpty) newData["city"] = selectedCity;

      // Perform update only if there is new data
      if (newData.isNotEmpty) {
        await docRef.update(newData);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data updated successfully!')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('No data to update!')));
      }
    } catch (error) {
      // Handle errors
      print('Error updating data in Firestore: $error');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        date.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/abstract-blur-shopping-mall.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0, left: 35),
                        child: IconButton(
                          onPressed: () async {
                            // Assuming you have a variable named currentUserEmail that holds the email of the current user
                            var userDoc = await FirebaseFirestore.instance
                                .collection('Roles')
                                .doc(currentUserEmail)
                                .get();
                            if (userDoc.exists) {
                              var role = userDoc.data()?[
                                  'role']; // Assuming 'role' is the field storing the role
                              if (role == 'User') {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrdersPage(),
                                  ),
                                );
                              }
                            } else {
                              // Handle the case where the user document doesn't exist
                            }
                          },
                          icon: Icon(
                            Icons.home_rounded,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // user info data show
                      UserInfoCard(logedinUser: currentUserEmail!),
                      // logo
                      Column(
                        children: [
                          Icon(
                            Icons.medical_information,
                            size: 100,
                            color: Colors.black,
                          ),
                          SizedBox(height: 25),
                          // message
                          Text(
                            "Let's finish the registration",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 25),
                          // email
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyTextFilde(
                                name,
                                "Name",
                                false,
                                Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                              ),
                              MyTextFilde(
                                age,
                                "age",
                                false,
                                Icon(
                                  Icons.person_pin_circle_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          // password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyTextFilde(
                                address,
                                "address in details",
                                false,
                                Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                ),
                              ),
                              MyTextFilde(
                                gender,
                                "gender",
                                false,
                                Icon(
                                  Icons.man_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          // password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyTextFilde(
                                phone,
                                "Phone Number",
                                false,
                                Icon(
                                  Icons.phone_iphone_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              MyTextFilde(
                                decoration: GestureDetector(
                                  onTap: () => _selectDate(context),
                                  child: Icon(Icons.calendar_today),
                                ),
                                date,
                                "Date",
                                false,
                                Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          // Dropdowns for governorate and city
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Governorate",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  DropdownButton<String>(
                                    enableFeedback: true,
                                    dropdownColor: Colors.blueAccent[200],
                                    elevation: 3,
                                    // isExpanded: true,
                                    borderRadius: BorderRadius.zero,
                                    icon: Icon(Icons.add_location),
                                    value: selectedGovernorate,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedGovernorate = newValue!;
                                        // Reset city selection when governorate changes
                                        selectedCity =
                                            cities[selectedGovernorate]![0];
                                      });
                                    },
                                    items: governorates.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                              SizedBox(width: 100),
                              Row(
                                children: [
                                  Text(
                                    "City",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  DropdownButton<String>(
                                    enableFeedback: true,
                                    dropdownColor: Colors.blueAccent[200],
                                    elevation: 3,
                                    icon: Icon(Icons.location_city_outlined),
                                    value: selectedCity,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedCity = newValue!;
                                      });
                                    },
                                    items: cities[selectedGovernorate]!
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          // sign up button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyButton(
                                  ontap: _saveUserData,
                                  "Save",
                                  icon: Icons.save),
                              ElevatedButton(
                                  onPressed: _updateUserData,
                                  child: Text("Update"))
                            ],
                          ),
                          SizedBox(height: 100),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
