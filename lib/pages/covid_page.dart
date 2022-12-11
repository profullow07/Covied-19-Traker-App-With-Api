import 'package:covied_19/Model/world_state_model.dart';
import 'package:covied_19/Services/Utillites/reuseable_button.dart';
import 'package:covied_19/Services/services.dart';
import 'package:covied_19/pages/countrieslist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class CoviedScreen extends StatefulWidget {
  const CoviedScreen({super.key});

  @override
  State<CoviedScreen> createState() => _CoviedScreenState();
}

class _CoviedScreenState extends State<CoviedScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final List<Color> colorsList = [
    Colors.blue,
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    ServicesState servicesState = ServicesState();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text("Covied Traker"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            FutureBuilder(
              future: servicesState.getWroldApi(),
              builder: (context, AsyncSnapshot<WorldModel> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                   flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 50,
                        controller: controller,
                      ));
                } else {
                  return Expanded(
                    child: Column(
                      children: [
                        // paichart code box
                        PieChart(
                          dataMap: {
                            "Total":
                                double.parse(snapshot.data!.cases.toString()),
                            "Recovered":
                                double.parse(snapshot.data!.recovered.toString()),
                            "Deaths":
                                double.parse(snapshot.data!.deaths.toString()),
                          },
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          animationDuration: const Duration(milliseconds: 1200),
                          chartType: ChartType.ring,
                          colorList: colorsList,
                          ringStrokeWidth: 25.0,
                          legendOptions: LegendOptions(
                              legendPosition: LegendPosition.left,
                              legendTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                    
                        const SizedBox(
                          height: 20,
                        ),
                    
                        /// total box code
                    
                        Card(
                          color: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                ReuseableButton(
                                  title: "Total",
                                  value: snapshot.data!.cases.toString(),
                                ),
                                ReuseableButton(
                                  title: "Recovered",
                                  value: snapshot.data!.recovered.toString(),
                                ),
                                ReuseableButton(
                                  title: "Deaths",
                                  value: snapshot.data!.deaths.toString(),
                                ),
                                ReuseableButton(
                                  title: "Today Deaths",
                                  value: snapshot.data!.todayDeaths.toString(),
                                ),
                                ReuseableButton(
                                  title: "Critical Case",
                                  value: snapshot.data!.critical.toString(),
                                ),
                                ReuseableButton(
                                  title: "Case of Million",
                                  value: snapshot.data!.casesPerOneMillion
                                      .toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // button
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CountriesListScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: const Text(
                                "Trak Countries",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
