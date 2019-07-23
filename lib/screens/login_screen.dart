import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String password;
  String email;
  bool IsSpinner = false;
  final _auth = FirebaseAuth.instance;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: IsSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              ChatTextField(
                controller: controller,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              ChatTextField(
                controller: controller,
                hintText: 'Enter your password',
                isPassword: true,
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {
                    IsSpinner = true;
                  });

                  try {

                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    if (user != null) {

                      Navigator.pushNamed(context, ChatScreen.id);
                      controller.clear();
                    }
                  } catch (e) {

                    IsSpinner = false;


                    controller.clear();
                    print(e);
                    email = '';
                    password = '';
                  }

                  setState(() {
                    IsSpinner = false;
                    controller.clear();
                    email = '';
                    password = '';
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
