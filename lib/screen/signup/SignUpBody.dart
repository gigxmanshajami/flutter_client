import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../style/appStyle.dart';
import '../HomePage.dart';
import '../signInScreen.dart';
import 'completeProfile/profile.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight*0.03),
            Text(
              "Register Account",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "Complete your detail",
                style: TextStyle(
                  color: ktextColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: screenHeight*0.04),
            SignUpForm(),
            SizedBox(height:screenHeight*0.04,),

            SizedBox(height:screenHeight*0.03,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("By continuing your confirm that you agree with our Team and Condition",
              textAlign: TextAlign.center,),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}






class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return  Form(
        child:Column(
          children: [
            TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return "Please Enter your Name";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your Name",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: Icon(Icons.person_2_outlined ),
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
              obscureText: true,
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
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
    );;
  }
}

