import 'package:flutter/material.dart';
import 'package:plant_b/core/separator.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/widget/main_button.dart';
import 'package:plant_b/widget/input_box.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPh = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Separator(height: 50.0),
              Text(
                'Create new account',
                style: headline1,
              ),
              Separator(height: 10.0),
              Text(
                'Please fill in the form to continue',
                style: headline3,
              ),
              Separator(height: 60.0),
              InputBox(
                controller: userName,
                keyBordType: TextInputType.name,
                hintTxt: 'Full Name',
              ),
              InputBox(
                controller: userEmail,
                keyBordType: TextInputType.emailAddress,
                hintTxt: 'Email Address',
              ),
              InputBox(
                controller: userPh,
                keyBordType: TextInputType.phone,
                hintTxt: 'Phone Number',
              ),
              InputBox(
                controller: userPass,
                isObs: true,
                hintTxt: 'Password',
              ),
              Separator(height: 80.0),
              MainButton(
                onTap: () {},
                text: 'Sign Up',
                btnColor: Colors.blue,
              ),
              Separator(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
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