import 'package:flutter/material.dart';
import 'package:shared/main.dart';

class ResetForm extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;
  final AuthenticationState state;
  ResetForm({this.authenticationBloc, this.state});
  @override
  _ResetFormState createState() => _ResetFormState();
}

class _ResetFormState extends State<ResetForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email address',
              filled: true,
              isDense: true,
            ),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'Email is required.';
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
                  : Text(
                      'Reset to email',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
              onPressed: () {
                if (_key.currentState.validate()) {
                  widget.authenticationBloc.add(UserSignUp(
                      email: _emailController.text,
                      password: _passwordController.text));
                } else {
                  print('Form not validated');
                }
              })
        ],
      ),
    );
  }
}
