import 'package:app/src/screens/attendance/attendance_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/main.dart';

class AttendanceScreen extends StatelessWidget {
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
                    title: Text("Attendance"),
                    leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  body: Center(
                    child: AttendanceMenu(),
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
}
