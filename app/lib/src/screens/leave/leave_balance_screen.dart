import 'package:app/src/screens/leave/leave_application_screen.dart';
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
    seriesList = _createLeaveData();
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
                  body: Container(
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
                              // defaultRenderer: charts.BarRendererConfig(
                              //     barRendererDecorator:
                              //         charts.BarLabelDecorator())
                            ))
                          ],
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
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LeaveApplicationScreen()),
                                );
                              },
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

  static List<charts.Series<LeaveBalance, String>> _createLeaveData() {
    final data1 = [
      LeaveBalance('Sabustitute Leave', 10),
      LeaveBalance('Sick Leave', 5),
      LeaveBalance('Leave Without Pay', 15),
      LeaveBalance('Compenstory Leave', 7),
      LeaveBalance('Casual Leave', 8),
      LeaveBalance('Annual Leave', 30),
    ];
    final data2 = [
      LeaveBalance('Sabustitute Leave', 3),
      LeaveBalance('Sick Leave', 7),
      LeaveBalance('Leave Without Pay', 2),
      LeaveBalance('Compenstory Leave', 6),
      LeaveBalance('Casual Leave', 2),
      LeaveBalance('Annual Leave', 10),
    ];
    final data3 = [
      LeaveBalance('Sabustitute Leave', 7),
      LeaveBalance('Sick Leave', 9),
      LeaveBalance('Leave Without Pay', 12),
      LeaveBalance('Compenstory Leave', 3),
      LeaveBalance('Casual Leave', 9),
      LeaveBalance('Annual Leave', 21),
    ];
    return [
      charts.Series<LeaveBalance, String>(
        id: 'LeaveBalance',
        domainFn: (LeaveBalance leave, _) => leave.name,
        measureFn: (LeaveBalance leave, _) => leave.day,
        data: data1,
      ),
      charts.Series<LeaveBalance, String>(
        id: 'LeaveBalance',
        domainFn: (LeaveBalance leave, _) => leave.name,
        measureFn: (LeaveBalance leave, _) => leave.day,
        data: data2,
      ),
      charts.Series<LeaveBalance, String>(
        id: 'LeaveBalance',
        domainFn: (LeaveBalance leave, _) => leave.name,
        measureFn: (LeaveBalance leave, _) => leave.day,
        data: data3,
      )
    ];
  }
}

class LeaveBalance {
  final String name;
  final int day;

  LeaveBalance(this.name, this.day);
}
