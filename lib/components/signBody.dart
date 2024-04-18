
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/HomePage.dart';
import '../screen/forgot_screen.dart';
import '../screen/signup/signUp.dart';
import '../style/appStyle.dart';
import 'package:flutter_svg/svg.dart';

bool _obsureText =false;
class signBody extends StatefulWidget {
  const signBody({Key? key}) : super(key: key);

  @override
  State<signBody> createState() => _signBodyState();
}

class _signBodyState extends State<signBody> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  bool changeButton = false;
  int time =1;

  moveTohome(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: time));
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      setState(() {
        changeButton = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
                children: [
                  SizedBox(height: screenHeight*0.04),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                      "Sign in with your email and password \n continue with social media",
                    style: TextStyle(
                      color: ktextColor,

                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight*0.06),
                  SignForm(
                    key: _formKey,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                          value: remember,
                          onChanged: (value){
                        setState(() {
                          remember =value!;
                        });
                      }),
                      Text("Remember Me"),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>forgotPassword()));
                        },
                        child: Text("Forgot password",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),),
                      ),
                    ],
                  ),
                  SizedBox(height:screenHeight*0.04,),

                  SizedBox(height:screenHeight*0.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont't have an account? ",style: TextStyle(
                        fontSize: 16,
                      ),),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context )=> signUpScreen()));
                        },
                        child: Text("Sign Up", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                          fontSize: 16,
                        ),),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),

                ],

              ),
        ),
    );
  }

}

Widget SocialCard(icon){
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(20),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFf5f6f9),
      ),
      child: SvgPicture.asset(icon),

    ),
  );

}




class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);


  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {


  @override
  Widget build(BuildContext context) {
    return Form(
        child:Column(
          children: [
            TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return "Please Enter the email";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                  child: Icon(Icons.email_outlined ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: ktextColor),
                  gapPadding: 10,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: kPrimaryColor,),
                  gapPadding: 10,

                )
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(

              validator: (value){
                if(value!.isEmpty){
                  return "Please Enter the password";
                }
                return null;
              },
              obscureText: !_obsureText,
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: Icon(Icons.lock_outline),
                  ),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: ktextColor),

                  gapPadding: 10,
                ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: kPrimaryColor),
                    gapPadding: 10,
                  ),//used to when its not in used or tapped

              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
              },
              child: Container(
                height: (56),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("Continue", style: TextStyle(
                  fontSize: (18),
                  color: CupertinoColors.white,
                ),)),
              ),
            ),
          ],
        )
    );
  }
}





