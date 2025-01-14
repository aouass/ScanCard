import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scan_card/User/CategoriesP.dart';
import 'package:scan_card/User/navigation_bar.dart';

class CategorieUser extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

//fonction pour le nombre total Organisation
  Future<int> _getOrganisationCount(String userId) async {
  QuerySnapshot contacts = await firestore
      .collection('contacts')
      .where('categorie', isEqualTo: 'Organisation')
      .where('userId', isEqualTo: userId) // Filtrer par userId
      .get();

  QuerySnapshot cartes = await firestore
      .collection('CarteScannee')
      .where('categorie', isEqualTo: 'Organisation')
      .where('userId', isEqualTo: userId) // Filtrer par userId
      .get();

  return contacts.size + cartes.size;
}


//fonction pour le nombre total Entreprise
  Future<int> _getEntrepriseCount(String userId) async {
    QuerySnapshot contacts = await firestore
        .collection('contacts')
        .where('categorie', isEqualTo: 'Entreprise')
        .where('userId', isEqualTo: userId) // Filtrer par userId
        .get();

    QuerySnapshot cartes = await firestore
        .collection('CarteScannee')
        .where('categorie', isEqualTo: 'Entreprise')
        .where('userId', isEqualTo: userId) // Filtrer par userId
        .get();

    return contacts.size + cartes.size;
  }

//fonction pour le nombre total Freelance
  Future<int> _getFreelanceCount(String userId) async {
    QuerySnapshot contacts = await firestore
        .collection('contacts')
        .where('categorie', isEqualTo: 'Freelance')
        .where('userId', isEqualTo: userId) // Filtrer par userId
        .get();

    QuerySnapshot cartes = await firestore
        .collection('CarteScannee')
        .where('categorie', isEqualTo: 'Freelance')
        .where('userId', isEqualTo: userId) // Filtrer par userId
        .get();

    return contacts.size + cartes.size;
  }

//fonction pour le nombre total Professionnel
  Future<int> _getProfessionnelCount(String userId) async {
    QuerySnapshot contacts = await firestore
        .collection('contacts')
        .where('categorie', isEqualTo: 'Professionnel')
        .where('userId', isEqualTo: userId) // Filtrer par userId
        .get();

    QuerySnapshot cartes = await firestore
        .collection('CarteScannee')
        .where('categorie', isEqualTo: 'Professionnel')
        .where('userId', isEqualTo: userId) // Filtrer par userId
        .get();

    return contacts.size + cartes.size;
  }

//fonction pour le nombre total Collegue
  Future<int> _getCollegueCount(String userId) async {
    QuerySnapshot contacts = await firestore
        .collection('contacts')
        .where('categorie', isEqualTo: 'Collegue')
        .where('userId', isEqualTo: userId) // Filtrer par userId
        .get();

    QuerySnapshot cartes = await firestore
        .collection('CarteScannee')
        .where('categorie', isEqualTo: 'Collegue')
        .where('userId', isEqualTo: userId) // Filtrer par userId
        .get();

    return contacts.size + cartes.size;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 60,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 6), // changes position
                      ),
                    ],
                  ),
                  child: Row(children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyNavigationBar()),
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                      iconSize: 25,
                      color: Color(0xFFF9754E),
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    const Text(
                      "Catégories",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    )
                  ])),
              const SizedBox(height: 60),
              FutureBuilder<int>(
                future: _getOrganisationCount(userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Loading state
                  } else if (snapshot.hasError) {
                    return Text('Error');
                  } else {
                    int count = snapshot.data ?? 0;
                    return Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 6), // changes position
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.groups_outlined,
                            color: Color(0xFF21396A),
                            size: 35,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Organisations",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "($count)", // Nombre dynamique
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrganisationPage()),
                              );
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded),
                            iconSize: 30,
                            color: const Color(0xFFF9754E),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 40),
              FutureBuilder<int>(
                future: _getEntrepriseCount(userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Loading state
                  } else if (snapshot.hasError) {
                    return Text('Error');
                  } else {
                    int count = snapshot.data ?? 0;
                    return Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 6), // changes position
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.groups_outlined,
                            color: Color(0xFF21396A),
                            size: 35,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Entreprise",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "($count)", // Nombre dynamique
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EntreprisePage()),
                              );
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded),
                            iconSize: 30,
                            color: const Color(0xFFF9754E),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 40),
              FutureBuilder<int>(
                future: _getFreelanceCount(userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Loading state
                  } else if (snapshot.hasError) {
                    return Text('Error');
                  } else {
                    int count = snapshot.data ?? 0;
                    return Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 6), // changes position
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.groups_outlined,
                            color: Color(0xFF21396A),
                            size: 35,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Freelance",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "($count)", // Nombre dynamique
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 62,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FreelancePage()),
                              );
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded),
                            iconSize: 30,
                            color: const Color(0xFFF9754E),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 40),
              FutureBuilder<int>(
                future: _getProfessionnelCount(userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Loading state
                  } else if (snapshot.hasError) {
                    return Text('Error');
                  } else {
                    int count = snapshot.data ?? 0;
                    return Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 6), // changes position
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.groups_outlined,
                            color: Color(0xFF21396A),
                            size: 35,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Professionnel",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "($count)", // Nombre dynamique
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 26,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfessionnelPage()),
                              );
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded),
                            iconSize: 30,
                            color: const Color(0xFFF9754E),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 40),
              FutureBuilder<int>(
                future: _getCollegueCount(userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Loading state
                  } else if (snapshot.hasError) {
                    return Text('Error');
                  } else {
                    int count = snapshot.data ?? 0;
                    return Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 6), // changes position
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.groups_outlined,
                            color: Color(0xFF21396A),
                            size: 35,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Collègue",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "($count)", // Nombre dynamique
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => colleguePage()),
                              );
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded),
                            iconSize: 30,
                            color: const Color(0xFFF9754E),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
