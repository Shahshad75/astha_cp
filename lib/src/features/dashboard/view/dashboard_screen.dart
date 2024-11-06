import 'package:astha_cp/src/features/dashboard/view/profile_screen.dart';
import 'package:astha_cp/src/features/dashboard/view/request_screen.dart';
import 'package:astha_cp/src/features/dashboard/widget/consultation_box.dart';
import 'package:astha_cp/src/features/dashboard/widget/proflie_box.dart';
import 'package:astha_cp/src/features/search_consultations/view/consultaion_details_screen.dart';
import 'package:astha_cp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final yData = [5, 15, 10, 6, 20, 12, 25];
  final xData = List.generate(10, (index) => (index += 5).toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          child: ListView(
            children: [
              const ProfileBox(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 19.0),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const ConsultaionDetailScreen())),
                  child: Container(
                    width: double.maxFinite,
                    height: 140,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Consultation details',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "ReadexPro",
                                fontWeight: FontWeight.w500,
                                color: primaryColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (ctx) {
                                    return const RequestScreen();
                                  }));
                                },
                                child: const ConsultationBox(
                                    count: "08",
                                    title: "Schedule",
                                    color: Color(0xff56BEAC)),
                              ),
                              const ConsultationBox(
                                  count: "23",
                                  title: "Total",
                                  color: primaryColor)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'Select a date range to view details',
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "ReadexPro",
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(5, 20, 20, 10),
                  width: double.infinity,
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_month_outlined),
                          SizedBox(width: 5),
                          Text(
                            'May 01,2024 to May 31,2024',
                            style: TextStyle(color: primaryColor),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: LineChart(
                          LineChartData(
                            backgroundColor: Colors.white70,
                            titlesData: titleData(xData),
                            gridData: const FlGridData(show: false),
                            borderData: FlBorderData(
                              show: true,
                              border: const Border(
                                left: BorderSide(
                                    color: Color(0xffe7e8ec), width: 1),
                                bottom: BorderSide(
                                    color: Color(0xffe7e8ec), width: 1),
                              ),
                            ),
                            lineBarsData: [
                              getReceivedLineData(yData),
                            ],
                            lineTouchData: const LineTouchData(
                              touchSpotThreshold: 30,
                              touchTooltipData: LineTouchTooltipData(
                                fitInsideHorizontally: true,
                                fitInsideVertically: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Days',
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Total Consultations',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  LineChartBarData getReceivedLineData(List<num> yData) {
    return LineChartBarData(
      spots: List.generate(
        yData.length,
        (index) => FlSpot(
          index.toDouble(),
          yData[index].toDouble(),
        ),
      ),
      isCurved: true,
      color: Colors.blue,
      barWidth: 2,
      isStrokeCapRound: false,
      preventCurveOverShooting: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: false,
        applyCutOffY: true,
        color: Colors.blue.withOpacity(.1),
      ),
    );
  }

  FlTitlesData titleData(List<String> xData) {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            var showBottom = value % 1 == 0;
            return showBottom
                ? SideTitleWidget(
                    axisSide: AxisSide.right,
                    child: Text(
                      xData[value.toInt()],
                      style: const TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  )
                : const SizedBox();
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          reservedSize: 45,
          showTitles: true,
          getTitlesWidget: (value, meta) {
            // String formattedValue = formatAmount(value);

            // Skip displaying values too close to each other
            if (value == meta.max) {
              final remainder = value % meta.appliedInterval;
              if (remainder != 0.0 && remainder / meta.appliedInterval < 0.5) {
                return const SizedBox.shrink();
              }
            }

            return SideTitleWidget(
              axisSide: AxisSide.left,
              child: value % 1 == 0
                  ? Text(
                      value.toInt().toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.blue),
                    )
                  : const SizedBox(),
            );
          },
        ),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }
}
