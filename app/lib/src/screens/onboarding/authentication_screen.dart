import 'package:app/src/screens/onboarding/login_screen.dart';
import 'package:app/src/screens/onboarding/reset_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared/main.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool showLoginForm = false;
  // ignore: close_sinks
  AuthenticationBloc authenticationBloc;
  @override
  void initState() {
    authenticationBloc = AuthenticationBlocController().authenticationBloc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _showError(String error) async {
      await Fluttertoast.showToast(
          msg: error,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return Scaffold(
        body: WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        cubit: authenticationBloc,
        listener: (context, state) {
          if (state is AuthenticationFailure) {
            _showError(state.message);
          }
        },
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            cubit: authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              return SafeArea(
                child: Stack(
                  children: [
                    Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Center(
                              child: Text(
                            showLoginForm ? 'RESET' : 'LOGIN',
                            style: Theme.of(context).textTheme.headline2,
                          )),
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: showLoginForm
                                ?
                                ResetForm(
                                    authenticationBloc: authenticationBloc,
                                    state: state,
                                  )
                                : 
                                 LoginForm(
                                    authenticationBloc: authenticationBloc,
                                    state: state,
                                ),
                          ),
                          showLoginForm
                              ? SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 12,
                                      ),
                                      FlatButton(
                                          child: Text(
                                            'Forget password?'),
                                          onPressed: () {
                                            setState(() {
                                              showLoginForm = true;
                                            });
                                          })
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                    !showLoginForm
                        ? SizedBox()
                        : Positioned(
                            left: 6,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 32,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  showLoginForm = false;
                                });
                              },
                            ),
                          )
                  ],
                ),
              );
            }),
      ),
    ));
  }
}
