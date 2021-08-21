// home screen contents
import 'package:app/src/config/image_constants.dart';
import 'package:app/src/screens/attendance/index.dart';
import 'package:app/src/widgets/cache_image_widget.dart';
import 'package:app/src/screens/home/home_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/main.dart';
import 'package:app/src/config/string_constants.dart' as string_constants;

class HomeScreen extends StatelessWidget {
  // ignore: close_sinks
  final AuthenticationBloc authenticationBloc =
      AuthenticationBlocController().authenticationBloc;

  @override
  Widget build(BuildContext context) {
    authenticationBloc.add(GetUserData());
    return WillPopScope(
        onWillPop: () async => false,
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            cubit: authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              if (state is SetUserData) {
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(
                      string_constants.app_bar_title,
                      style: Theme.of(context).appBarTheme.textTheme.bodyText1,
                    ),
                    actions: [
                      IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: () {
                            authenticationBloc.add(UserLogOut());
                          }),
                    ],
                  ),
                  body: Center(
                    // everything at home
                    child: HomeMenuScreen(),
                  ),
                  drawer: Drawer(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        DrawerHeader(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white),
                                    child: CachedImage(
                                      imageUrl:
                                          state.currentUserData.data.avatar,
                                      fit: BoxFit.fitWidth,
                                      errorWidget: Image.network(
                                        AllImages().kDefaultImage,
                                      ),
                                      width: 80,
                                      height: 80,
                                      placeholder: CircularProgressIndicator(),
                                    ),
                                  ),
                                  // Switch(
                                  //   value:
                                  //       Provider.of<AppStateNotifier>(context)
                                  //           .isDarkMode,
                                  //   onChanged: (value) {
                                  //     Provider.of<AppStateNotifier>(context,
                                  //             listen: false)
                                  //         .updateTheme(value);
                                  //   },
                                  // ),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 20.0),
                                      child: Text(
                                          'Welcome ${state.currentUserData.data.firstName} ${state.currentUserData.data.lastName}'),
                                    )
                                  ])
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        // ExpansionTile(
                        //   title: Text("Expansion Title"),
                        //   children: <Widget>[
                        //     Text("children 1"),
                        //     Text("children 2")
                        //   ],
                        // ),
                        // ListTile(
                        //   title: Text(
                        //       '${state.currentUserData.data.firstName} ${state.currentUserData.data.lastName}',
                        //       style: Theme.of(context).textTheme.bodyText2),
                        // ),
                        // ListTile(
                        //   title: Text(state.currentUserData.data.email,
                        //       style: Theme.of(context).textTheme.bodyText2),
                        // ),
                        // ListTile(
                        //   title: Text(state.currentUserData.ad.company,
                        //       style: Theme.of(context).textTheme.bodyText2),
                        // ),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Menu',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),

                        ListTile(
                            leading: Icon(
                              Icons.dashboard,
                              color: Colors.black,
                            ),
                            title: Text(
                              'Dashboard',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            selected: true,
                            onTap: () => {print("dashboard")},
                            selectedTileColor: Colors.grey.shade300),

                        ListTile(
                          leading: Icon(
                            Icons.add_comment,
                            color: Colors.black,
                          ),
                          title: Text(
                            'Attendance',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          selected: false,
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AttendanceScreen()),
                            )
                          },
                        ),
                      ],
                    ),
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
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }));
  }
}
