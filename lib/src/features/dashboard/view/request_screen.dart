
import 'package:astha_cp/src/features/dashboard/widget/file_card.dart';
import 'package:astha_cp/src/widget/button.dart';
import 'package:astha_cp/utils/colors.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

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
      body: SingleChildScrollView(
        child: Stack(
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
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, top: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text(
                                "Chief Complaint",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 33, 33, 33),
                                    fontFamily: "ReadexPro",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  "This is a message entered by the agent on behalf of the patient",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "ReadexPro",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ])),
                        Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: primaryColor, width: 2),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: SizedBox(
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/play_icon.png")),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0, bottom: 5),
                                child: Center(
                                  child: Text(
                                    "Play audio",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: "ReadexPro",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: SizedBox(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                Text(
                                  "Consultation records",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 33, 33, 33),
                                      fontFamily: "ReadexPro",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "02",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 33, 33, 33),
                                      fontFamily: "ReadexPro",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ])),
                        ),
                        const FileCard(
                          shadow: true,
                        ),
                        const FileCard(
                          shadow: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "The consultation has been scheduled for",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 33, 33, 33),
                                      fontFamily: "ReadexPro",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "3:30 PM | Wed | June 26,2024",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 33, 33, 33),
                                      fontFamily: "ReadexPro",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomButtom(
                            onTap: () {},
                            text: "Accept",
                            color: primaryColor,
                            textColor: Colors.white,
                            borderColor: primaryColor,
                            radius: 20),
                        CustomButtom(
                            onTap: () {},
                            text: "Reject",
                            color: const Color.fromARGB(73, 244, 67, 54),
                            textColor: Colors.red,
                            borderColor: const Color.fromARGB(0, 244, 67, 54),
                            radius: 20)
                      ],
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
      ),
    );
  }
}
