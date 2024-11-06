
import 'package:astha_cp/src/features/search_consultations/widget/patient_consultation_tile.dart';
import 'package:astha_cp/utils/colors.dart';
import 'package:flutter/material.dart';

class PatientConsultationsScreen extends StatelessWidget {
  const PatientConsultationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text(
          "Jennifer Lawrence",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "ReadexPro",
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: primaryColor,
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg.png"),
                        fit: BoxFit.contain)),
                height: 90,
                width: double.infinity,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, top: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "All consultations",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 33, 33, 33),
                                  fontFamily: "ReadexPro",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "03",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 33, 33, 33),
                                  fontFamily: "ReadexPro",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return const PatientConsultaionTile(
                                    patientName: "Cp name",
                                    status: true,
                                    time: "10.01.2024 - 5:00 PM");
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: (MediaQuery.of(context).size.width / 2) - 50,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2, color: Colors.white),
                image: const DecorationImage(
                  image: AssetImage("assets/images/men.webp"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
