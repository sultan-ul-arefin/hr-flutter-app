import 'package:flutter/material.dart';
import 'package:shared/main.dart';

class LoginForm extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;
  final AuthenticationState state;
  LoginForm({this.authenticationBloc, this.state});
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _loginIdController = TextEditingController();
  var _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Login ID',
              filled: true,
              isDense: true,
            ),
            controller: _loginIdController,
            keyboardType: TextInputType.text,
            autocorrect: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'Login Id is required.';
              }
              return null;
            },
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              filled: true,
              isDense: true,
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).hintColor,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
            obscureText: !_passwordVisible,
            controller: _passwordController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Password is required.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              padding: const EdgeInsets.all(16),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0)),
              child: widget.state is AuthenticationLoading
                  ? CircularProgressIndicator(
                      backgroundColor:
                          Theme.of(context).textTheme.bodyText1.color,
                    )
                  : Text('Login', style: Theme.of(context).textTheme.bodyText1),
              onPressed: () {
                if (_key.currentState.validate()) {
                  widget.authenticationBloc.add(UserLogin(
                      loginId: _loginIdController.text,
                      password: _passwordController.text));
                } else {}
              })
        ],
      ),
    );
  }
}
