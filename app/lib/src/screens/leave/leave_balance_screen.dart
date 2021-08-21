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
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      charts.BarChart(
                        seriesList,
                        animate: animate,
                        vertical: false,
                      )
                    ],
                  )),
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

    /// Create one series with sample hard coded data.
    List<charts.Series<OrdinalSales, String>> _createSampleData() {
      final data = [
        new OrdinalSales('2014', 5),
        new OrdinalSales('2015', 25),
        new OrdinalSales('2016', 100),
        new OrdinalSales('2017', 75),
      ];

      return [
        new charts.Series<OrdinalSales, String>(
          id: 'Sales',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data,
        )
      ];
    }
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
