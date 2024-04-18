
import 'package:flutter/material.dart';

import '../style/appStyle.dart';
import 'attendancePreview.dart';
import 'attendancescreen.dart';
import 'expenseForm.dart';
import 'expensesPreview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            ),
          ),
          actions: [
            // Add your logo here
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset(
                'assets/images/logo.png',
                width: 80, // Adjust size as needed
                height: 40, // Adjust size as needed
              ),
            ),
          ],
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 80),
              CustomButton("Attendance", AttendaceScreen()),
              SizedBox(height: 20),
              CustomButton("Expenses Form", expenseForm()),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white, // Change drawer header color
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 80, // Adjust size as needed
                    height: 40, // Adjust size as needed
                  )),
              ListTile(
                title: Text('Attendance'),
                onTap: () {
                  // Navigate to Attendance page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AttendancePreview()),
                  );
                },
              ),
              ListTile(
                title: Text('Expenses'),
                onTap: () {
                  // Navigate to Feedbacks page
                  // Replace FeedbacksPage with your actual feedbacks page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExpensePreview(
                                // Pass some dummy expense data for demonstration
                                expenses: [
                                  Expense(
                                    date: DateTime.now(),
                                    location: 'City A',
                                    lodgingAmount: 100.0,
                                    mealAmount: 50.0,
                                    othersAmount: 30.0,
                                    description: 'Some descridssssssd;mal;cvansl;f ,vbnakl; nvesdl;hveos;hveos;hgseovbsdl;vnwek;gjb ption',
                                  ),
                                  Expense(
                                    date: DateTime.now(),
                                    location: 'City b',
                                    lodgingAmount: 23100.0,
                                    mealAmount: 503.0,
                                    othersAmount: 302.0,
                                    description: 'Some description',
                                  )
                                ])),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  // Perform logout action
                  // For example, you can pop all routes to return to the login screen
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          color: Colors.black, // Change the background color
          child:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '© Monad Electronics.',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'All Rights Reserved',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Developed and managed by:Nikesh & Navneet',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}

Widget CustomButton(label, navigation) {
  return Builder(
    builder: (context) => InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigation),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: kthirdColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 100,
        width: 200,
        child: Center(
            child: Text(
          label,
          style: TextStyle(
            color: Colors.white, // Set text color to white
            fontSize: 16, // Adjust font size as needed
            fontWeight: FontWeight.bold, // Adjust font weight as needed
          ),
        )),
      ),
    ),
  );
}
