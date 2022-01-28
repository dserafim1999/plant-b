import 'package:flutter/material.dart';
import 'package:plant_b/core/separator.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/main.dart';
import 'package:plant_b/models/user.model.dart';
import 'package:plant_b/widget/input_box.dart';
import 'package:plant_b/widget/main_button.dart';
import 'package:plant_b/pages/account/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController id = TextEditingController();
  TextEditingController userPass = TextEditingController();

  @override
  void initState() {
    super.initState();
    login(11111111);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff86C24B),
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Separator(height: 40.0),
              Image.asset(
                'assets/logo_text.png',
                width: 300,
              ),
              Separator(height: 80.0),
              InputBox(
                controller: id,
                hintTxt: 'Identification Number',
              ),
              InputBox(
                controller: userPass,
                isObs: true,
                hintTxt: 'Password',
              ),
              Separator(height: 5.0),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: headline3,
                    ),
                  ),
                ),
              ),
              Separator(height: 130.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    MainButton(
                      onTap: () async {
                        if (int.tryParse(id.text) != null && id.text.length == 8) {
                          print("hello");
                          await login(int.parse(id.text));
                        }
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      },
                      text: 'Sign In',
                      txtColor: Colors.white,
                      btnColor: Color(0xff63982E),
                    ),
                    Separator(height: 20.0),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const SignUpPage()));
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style: headline.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: ' Sign Up',
                            style: headlineDot.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}