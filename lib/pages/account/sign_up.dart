import 'package:flutter/material.dart';
import 'package:plant_b/core/separator.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/core/url.dart';
import 'package:plant_b/pages/account/sign_in.dart';
import 'package:plant_b/pages/account/welcome_screen.dart';
import 'package:plant_b/widget/main_button.dart';
import 'package:plant_b/widget/input_box.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController userBirthDate = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userConfirmPass = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff86C24B),
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Separator(height: 10.0),
              Text(
                'Sign Up',
                style: headline1,
              ),
              Separator(height: 30.0),
              InputBox(
                controller: userName,
                keyBordType: TextInputType.name,
                hintTxt: 'Username',
              ),
              InputBox(
                controller: userEmail,
                keyBordType: TextInputType.emailAddress,
                hintTxt: 'Email Address',
              ),
              InputBox(
                controller: userId,
                keyBordType: TextInputType.phone,
                hintTxt: 'Identification Number',
              ),
              InputBox(
                controller: userBirthDate,
                keyBordType: TextInputType.phone,
                hintTxt: 'Birth Date',
              ),
              InputBox(
                controller: userPass,
                isObs: true,
                hintTxt: 'Password',
              ),
              InputBox(
                controller: userConfirmPass,
                isObs: true,
                hintTxt: 'Confirm Password',
              ),
              Separator(height: 50.0),
              MainButton(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                  );
                },
                text: 'Sign Up',
                txtColor: Colors.white,
                btnColor: Color(0xff63982E),
              ),
              Separator(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
                  );
                },
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Have an account? ',
                      style: headline.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                    TextSpan(
                      text: ' Sign In',
                      style: headlineDot.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}