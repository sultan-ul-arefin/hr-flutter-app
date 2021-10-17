import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/main.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MyAttendanceScreen extends StatelessWidget {
  List<charts.Series> seriesList;
  bool animate;
  final AuthenticationBloc authenticationBloc =
      AuthenticationBlocController().authenticationBloc;
  @override
  Widget build(BuildContext context) {
    seriesList = _createSampleData();
    return WillPopScope(
        onWillPop: () async => false,
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            cubit: authenticationBloc,
            // ignore: missing_return
            builder: (BuildContext context, AuthenticationState state) {
              if (state is SetUserData) {
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text("My Attendance"),
                    leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  body: Column(
                    children: <Widget>[
                      Container(
                          height: 200,
                          color: Colors.white,
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.all(8),
                          child: charts.PieChart(
                            seriesList,
                            animate: animate,
                            defaultRenderer: new charts.ArcRendererConfig(
                                arcWidth: 60,
                                arcRendererDecorators: [
                                  new charts.ArcLabelDecorator(
                                      labelPosition:
                                          charts.ArcLabelPosition.auto)
                                ]),
                            defaultInteractions: true,
                          )),
                      Container(
                        color: Colors.white,
                        height: 400,
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView(children: <Widget>[
                                DataTable(
                                  columns: [
                                    DataColumn(
                                        label: Text('Date',
                                            style: TextStyle(
                                                color: Colors.black))),
                                    DataColumn(
                                        label: Text('In',
                                            style: TextStyle(
                                                color: Colors.black))),
                                    DataColumn(
                                        label: Text('Out',
                                            style: TextStyle(
                                                color: Colors.black))),
                                    DataColumn(
                                        label: Text('WH',
                                            style: TextStyle(
                                                color: Colors.black))),
                                    DataColumn(
                                        label: Text('Status',
                                            style: TextStyle(
                                                color: Colors.black))),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      DataCell(Text('1')),
                                      DataCell(Text('2')),
                                      DataCell(Text('3')),
                                      DataCell(Text('4')),
                                      DataCell(Text('5')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('5')),
                                      DataCell(Text('4')),
                                      DataCell(Text('3')),
                                      DataCell(Text('2')),
                                      DataCell(Text('1')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('1')),
                                      DataCell(Text('2')),
                                      DataCell(Text('3')),
                                      DataCell(Text('4')),
                                      DataCell(Text('5')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('5')),
                                      DataCell(Text('4')),
                                      DataCell(Text('3')),
                                      DataCell(Text('2')),
                                      DataCell(Text('1')),
                                    ]),
                                  ],
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  bottomNavigationBar: Container(
                    height: 40.0,
                    child: Center(
                      child: Text(
                        "Copyright \u00a9 Artechtive Limited",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  backgroundColor: Colors.white70,
                );
              }
            }));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 5),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
