
import 'package:astha_cp/src/features/search_consultations/widget/consultaion_tile.dart';
import 'package:astha_cp/src/features/search_consultations/widget/patient_tile.dart';
import 'package:astha_cp/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: primaryColor,
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Search",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "ReadexPro",
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        hintText: 'Search patient and consultation',
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: "ReadexPro",
                            fontSize: 15),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 19),
                    child: Column(
                      children: [
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                !isOnline
                                    ? "Upcoming consultations"
                                    : "Past consultations",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 33, 33, 33),
                                    fontFamily: "ReadexPro",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              CupertinoSwitch(
                                trackColor:
                                    const Color.fromARGB(255, 4, 51, 95),
                                thumbColor:
                                    const Color.fromARGB(255, 11, 151, 8),
                                value: isOnline,
                                onChanged: (value) {
                                  setState(() {
                                    isOnline = !isOnline;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                if (index == 2) {
                                  return const PatientTile(
                                    patientName: "Jennifer Lawres",
                                    phoneNumber: "+91 9090909090",
                                    blocDistrict: "Block 10, District",
                                    imagePath: "assets/images/men.webp",
                                  );
                                }
                                return const ConsultaionTile(
                                  patientName: 'Patient name',
                                  cpName: 'Cp name',
                                  time: '13.01.2024 - 11:00 AM',
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
