import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:scoped_model/scoped_model.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  MedicalModel model = MedicalModel();

  List<String> hospitalList = [];

  loadHospitalList() {
    hospitalList = model.hospitalCollection
        .map((hospMap) => hospMap[hospMap.keys.first][0])
        .toList();
  }

  final Map<String, double> hospitalCount = {};

  hospitalStat() {
    //gets the number of visits to each hospital for all the clients

    int count = 0;
    model.clientList
        .map((client) => client.historyList.map((history) {
              if (hospitalCount[history.hospitalName] == null)
                hospitalCount[history.hospitalName] = 0;
              hospitalCount[history.hospitalName] =
                  hospitalCount[history.hospitalName] + 1;
            }).toList())
        .toList();

//hospitalList.map((hospitalName){
//  hospitalCount[hospitalName]=count;
//});
  }

  final Map<String, double> companyCount = {};

  companyStat() {
    //gets the number of visits to each hospital for all the clients

    int count = 0;
    model.clientList.map((client) {
      if (companyCount[client.userProfile.company.companyName] == null)
        companyCount[client.userProfile.company.companyName] = 0;
      companyCount[client.userProfile.company.companyName] =
          companyCount[client.userProfile.company.companyName] + 1;
    }).toList();


//hospitalList.map((hospitalName){
//  hospitalCount[hospitalName]=count;
//});
  }

  bool toggle = true;

  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  void togglePieChart() {
    setState(() {
      toggle = !toggle;
    });
  }

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    hospitalStat();
    companyStat();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Center(
          child: DraggableScrollbar.rrect(
        backgroundColor: Colors.grey,
        controller: _scrollController,
        alwaysVisibleScrollThumb: true,
        child: ListView(
          shrinkWrap: true,
          controller: _scrollController,
          children: [
            Center(child: Text('Hospital Pie Chart')),
            PieChart(
              dataMap: hospitalCount,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32.0,
              chartRadius: MediaQuery.of(context).size.width / 5.5,
              showChartValuesInPercentage: true,
              showChartValues: true,
              showChartValuesOutside: false,
              chartValueBackgroundColor: Colors.grey[200],
              colorList: colorList,
              showLegends: true,
              legendPosition: LegendPosition.right,
              decimalPlaces: 1,
              showChartValueLabel: true,
              initialAngle: 0,
              chartValueStyle: defaultChartValueStyle.copyWith(
                color: Colors.blueGrey[900].withOpacity(0.9),
              ),
              chartType: ChartType.ring,
            ),
            Center(child: Text('Company Pie Chart')),
            PieChart(
              dataMap: companyCount,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32.0,
              chartRadius: MediaQuery.of(context).size.width / 5.5,
              showChartValuesInPercentage: true,
              showChartValues: true,
              showChartValuesOutside: false,
              chartValueBackgroundColor: Colors.grey[200],
              colorList: colorList,
              showLegends: true,
              legendPosition: LegendPosition.right,
              decimalPlaces: 1,
              showChartValueLabel: true,
              initialAngle: 0,
              chartValueStyle: defaultChartValueStyle.copyWith(
                color: Colors.blueGrey[900].withOpacity(0.9),
              ),
              chartType: ChartType.ring,
            ),
          ],
        ),
      )),
    );
  }
}
