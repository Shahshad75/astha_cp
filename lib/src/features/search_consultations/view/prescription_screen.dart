
import 'package:astha_cp/src/features/search_consultations/widget/custom_drop_down.dart';
import 'package:astha_cp/src/features/search_consultations/widget/meditation_form_tile.dart';
import 'package:astha_cp/src/widget/button.dart';
import 'package:astha_cp/src/widget/textfield.dart';
import 'package:astha_cp/utils/colors.dart';
import 'package:flutter/material.dart';

class PrescriptionScreen extends StatelessWidget {
   PrescriptionScreen({super.key});
final controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
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
                  "CONSULTATION",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10),
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
                  style:
                      TextStyle(color: Colors.white, fontFamily: "ReadexPro"),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                    child: Text(
                      "₹ 150",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Colors.blue,
                          fontFamily: "ReadexPro"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffEEF8FF),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.contacts_outlined,
                      size: 20,
                      color: Color(0xff8696A4),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'The call has been ended',
                      style: TextStyle(fontSize: 14, color: Color(0xff8696A4)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Color(0xffEEF8FF),
                ),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Please enter the prescription',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Your observation',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8696A4),
                      ),
                    ),
                    const SizedBox(height: 10),
                     CutomTextfield(
                      controller:controller ,
                      validator: (value){},
                      maxLine: 8,
                      minLine: 4,
                      text: 'Enter your observations',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Medication',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8696A4),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xff29536B), width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * .26,
                                child: MeditationFormTile(
                                  title: 'Type',
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    height: 52,
                                    width: double.maxFinite,
                                    child: const Text(
                                      'Injection',
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MeditationFormTile(
                                      title: 'Medicine',
                                      child: CustomDropDown(
                                        hint: 'hint text',
                                        items: List.generate(
                                            4, (index) => 'item $index'),
                                        onChanged: (v) {},
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: MediaQuery.sizeOf(context).width * .2,
                                  child: MeditationFormTile(
                                    title: 'Dose',
                                    child: CustomDropDown(
                                      hint: 'hint',
                                      items:
                                          List.generate(4, (index) => '$index'),
                                      onChanged: (v) {},
                                    ),
                                  )),
                              const SizedBox(width: 10),
                              SizedBox(
                                  width: MediaQuery.sizeOf(context).width * .25,
                                  child: MeditationFormTile(
                                    title: 'Frequency',
                                    child: CustomDropDown(
                                      hint: 'hint text',
                                      items: List.generate(
                                          4, (index) => 'item $index'),
                                      onChanged: (v) {},
                                    ),
                                  )),
                              const SizedBox(width: 10),
                               Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MeditationFormTile(
                                      title: 'Comments',
                                      child: CutomTextfield(
                                             controller:controller ,
                      validator: (value){},
                                        text: 'comments',
                                        maxLine: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: MediaQuery.sizeOf(context).width * .20,
                                  child: MeditationFormTile(
                                    title: 'Duration',
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      height: 52,
                                      width: double.maxFinite,
                                      child: const Text(
                                        '0',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  )),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MeditationFormTile(
                                      title: '',
                                      child: CustomDropDown(
                                        hint: 'Select Duration',
                                        items: List.generate(
                                            4, (index) => '$index'),
                                        onChanged: (v) {},
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                           MeditationFormTile(
                            title: 'Note',
                            child: CutomTextfield(
                                   controller:controller ,
                      validator: (value){},
                              text: 'note',
                              maxLine: 5,
                              minLine: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButtom(
                        onTap: () {},
                        text: "Add Medicie",
                        padding: 0,
                        size: 48,
                        color: const Color.fromARGB(0, 134, 150, 164),
                        textColor: const Color(0xff8696A4),
                        borderColor: const Color(0xff8696A4),
                        radius: 15),
                    MeditationFormTile(
                        title: 'Lab Test',
                        child: CustomDropDown(
                          hint: "Blood Test",
                          onChanged: (value) {},
                          items: const [
                            "Blood Test",
                            "Sugar Test",
                            "Pressure Test"
                          ],
                        )),
                    CustomButtom(
                        onTap: () {},
                        text: "Add Test",
                        padding: 0,
                        size: 48,
                        color: const Color.fromARGB(0, 134, 150, 164),
                        textColor: const Color(0xff8696A4),
                        borderColor: const Color(0xff8696A4),
                        radius: 15),
                     Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: MeditationFormTile(
                        title: 'Next consultation (optional)',
                        child: CutomTextfield(
                               controller:controller ,
                      validator: (value){},
                          text: 'Select the dates for next consultation',
                          maxLine: 3,
                          suffixIcon: const Icon(
                            Icons.calendar_month,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    CustomButtom(
                        onTap: () {},
                        text: "Submit",
                        color: primaryColor,
                        textColor: Colors.white,
                        borderColor: primaryColor,
                        radius: 30)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
