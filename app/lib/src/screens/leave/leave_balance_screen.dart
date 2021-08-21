import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/main.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LeaveBalanceScreen extends StatelessWidget {
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
                    title: Text("Leave Balance"),
                    leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  body: Center(
                    child: Container(
                      height: 600,
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        borderOnForeground: true,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: charts.BarChart(
                                seriesList,
                                animate: animate,
                                vertical: false,
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  persistentFooterButtons: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: FlatButton(
                              child: Text('Application For Leave'),
                              color: Colors.black,
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    )
                  ],
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

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('2014', 5),
      OrdinalSales('2015', 25),
      OrdinalSales('2016', 100),
      OrdinalSales('2017', 75),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
