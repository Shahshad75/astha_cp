import 'package:astha_cp/src/features/dashboard/widget/document_box.dart';
import 'package:astha_cp/src/features/dashboard/widget/textTile.dart';
import 'package:astha_cp/src/model/user_model.dart';
import 'package:astha_cp/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final UserModel user;
  const ProfileScreen({super.key, required this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 210,
              decoration: const BoxDecoration(
                  color: primaryColor,
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"))),
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.white),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/men.webp"),
                              fit: BoxFit.cover),
                        ),
                        width: 80,
                        height: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                  child: SizedBox(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                    Text(
                                      widget.user.firstName +
                                          widget.user.lastName,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: "ReadexPro",
                                          fontSize: 23,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Text(
                                      "4d4s5d5a55a6ad",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "ReadexPro",
                                          color: Colors.white),
                                    ),
                                  ]))),
                            ),
                            Expanded(
                                child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CupertinoSwitch(
                                    focusColor: Colors.white,
                                    trackColor: Colors.white,
                                    thumbColor: primaryColor,
                                    value: isOnline,
                                    onChanged: (bool value) {
                                      setState(() {
                                        isOnline = value;
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      isOnline ? 'Online' : 'Offline',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
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
                    child: SingleChildScrollView(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextTile(
                            title: "Phone number",
                            text: widget.user.personalMobile,
                          ),
                          TextTile(
                            title: "Email address",
                            text: widget.user.email,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextTile(
                                  title: "Gender",
                                  text: widget.user.gender,
                                ),
                                const TextTile(
                                  title: "Age",
                                  text: "28",
                                )
                              ],
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              DocumentBox(text: "ID Proof"),
                              DocumentBox(text: "Qualification")
                            ],
                          )
                        ],
                      ),
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
