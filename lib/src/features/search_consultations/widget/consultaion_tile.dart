import 'package:astha_cp/src/features/search_consultations/view/consultaion_details_screen.dart';
import 'package:flutter/material.dart';

class ConsultaionTile extends StatelessWidget {
  final String patientName;
  final String cpName;
  final String time;

  const ConsultaionTile({
    Key? key,
    required this.patientName,
    required this.cpName,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: const Color(0xffEEF8FF),
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/patient_info_logo.png"),
                  )),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patientName,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "ReadexPro"),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cpName,
                    style: const TextStyle(
                      fontFamily: "ReadexPro",
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.access_time,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontFamily: "ReadexPro"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => ConsultaionDetailScreen()));
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.grey),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.grey,
                  size: 19,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
