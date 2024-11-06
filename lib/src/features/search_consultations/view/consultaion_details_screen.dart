
import 'package:astha_cp/src/features/dashboard/widget/file_card.dart';
import 'package:astha_cp/src/widget/button.dart';
import 'package:astha_cp/utils/colors.dart';
import 'package:flutter/material.dart';

class ConsultaionDetailScreen extends StatelessWidget {
  const ConsultaionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // const Image(image: AssetImage("assets/images/bg.png")),
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
            style: TextStyle(
                // fontWeight: FontWeight.w500,
                // fontSize: 19,
                color: Colors.white,
                fontFamily: "ReadexPro"),
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
                    color: Colors.red,
                    fontFamily: "ReadexPro"),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(86, 255, 255, 255)),
            child: const Center(
              child: Text(
                "The consultation has been completed",
                style: TextStyle(
                    fontSize: 15, color: Colors.white, fontFamily: "ReadexPro"),
              ),
            ),
          ),
        ),
        CustomButtom(
            onTap: () {},
            text: "View prescription",
            color: const Color.fromARGB(0, 0, 0, 0),
            textColor: Colors.white,
            borderColor: Colors.white,
            radius: 30),
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
        const Spacer(),
        CustomButtom(
            onTap: () {},
            text: "Close Consultation",
            color: const Color(0xff07004D),
            textColor: Colors.white,
            borderColor: const Color(0xff07004D),
            radius: 30)
      ])),
    );
  }
}
