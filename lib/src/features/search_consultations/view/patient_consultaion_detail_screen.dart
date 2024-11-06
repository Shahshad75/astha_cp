
import 'package:astha_cp/src/features/dashboard/widget/file_card.dart';
import 'package:astha_cp/src/features/search_consultations/view/prescription_screen.dart';
import 'package:astha_cp/utils/colors.dart';
import 'package:flutter/material.dart';

class PatientConsultaionDetailScreen extends StatelessWidget {
  const PatientConsultaionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.white),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
                const Text(
                  "CONSULTATION",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      color: Colors.white,
                      fontFamily: "ReadexPro"),
                ),
                const SizedBox()
              ],
            ),
          ),
          ListTile(
            title: const Text(
              "Jennifer lawrence",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                  color: Colors.white,
                  fontFamily: "ReadexPro"),
            ),
            subtitle: const Text(
              "10.01.2024 - 5:00 PM",
              style: TextStyle(color: Colors.white, fontFamily: "ReadexPro"),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  "₹ 150",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Color.fromARGB(255, 8, 89, 156),
                      fontFamily: "ReadexPro"),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) =>  PrescriptionScreen()));
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      child: Row(children: [
                    CircleAvatar(
                      radius: 27,
                      child: Image(
                          image: AssetImage("assets/images/contact_icon.png")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Join the call",
                        style: TextStyle(
                            fontSize: 19,
                            color: primaryColor,
                            fontFamily: "ReadexPro",
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ])),
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: primaryColor,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 10),
            child: Text(
              "Consultation documents ",
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontFamily: "ReadexPro",
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              child: Column(
                children: [
                  FileCard(
                    shadow: false,
                  ),
                  FileCard(
                    shadow: false,
                  )
                ],
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
