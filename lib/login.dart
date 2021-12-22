import 'package:flutter/material.dart';
import 'package:integration_test_sample/second_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _username;

  TextEditingController _password;

  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final font12spW400 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );

    Widget _loginCard(context) => Container(
          padding: EdgeInsets.all(22),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: font12spW400.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: Key('usernameField'),
                  controller: _username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your Text',
                  ),
                  validator: (value) =>
                      value.isEmpty ? 'Input at least one character' : null,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  key: Key('passwordField'),
                  controller: _password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your Text',
                  ),
                  validator: (value) =>
                      value.isEmpty ? 'Input at least one character' : null,
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _username.clear();
                      _password.clear();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SecondPage();
                          },
                        ),
                      );
                    }
                  },
                  child: Text("Login"),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () async {
                    // await Navigator.pushNamed(
                    //     context, Routes.FORGOT_PASSWORD_SCREEN);
                  },
                  child: Text(
                    'Forgot password?',
                    textAlign: TextAlign.center,
                    style: font12spW400.copyWith(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    // await Navigator.pushNamed(context, Routes.REGISTER_SCREEN);
                  },
                  child: Text.rich(
                    TextSpan(
                        text: 'No account?',
                        style: font12spW400.copyWith(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'register',
                            style: font12spW400.copyWith(color: Colors.red),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        );

    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                Color(0xFFef642b),
                Color(0xFFeb3f29),
              ])),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(
                    height: 29,
                  ),
                  GestureDetector(
                    onTap: () async {},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "English",
                              style: font12spW400,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            CircleAvatar(
                              radius: 10,
                            )
                          ],
                        ),
                        // height: 27.5,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 41.5,
                  ),
                  FlutterLogo(),
                  const SizedBox(
                    height: 28.0,
                  ),
                  _loginCard(context),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
