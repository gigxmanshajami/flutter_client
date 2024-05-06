import 'package:flutter/material.dart';

import '../style/appStyle.dart';

class expenseForm extends StatefulWidget {
  const expenseForm({Key? key}) : super(key: key);

  @override
  State<expenseForm> createState() => _expenseFormState();
}

class _expenseFormState extends State<expenseForm> {
  String? _selectedOption;  // Default selected option

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Form',style: TextStyle(color: kthirdColor,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.currency_rupee,color: kthirdColor,),
                  Text(
                    "Expenses",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: kthirdColor
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 16,),
            Container(
              width: double.infinity,
              height: screenHeight * 0.14,
              child: TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: "Description",
                  hintText: "Write the description of Work",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: Icon(Icons.edit_note),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ktextColor),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                    gapPadding: 10,
                  ), //used to when its not in used or tapped
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter the Location";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Location",
                hintText: "Enter your Location",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                  child: Icon(Icons.location_on_outlined),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ktextColor),
                  gapPadding: 10,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  gapPadding: 10,
                ), //used to when its not in used or tapped
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Select Type: '),
                SizedBox(width: 16),
                DropdownButton<String>(
                  value: _selectedOption,
                  hint: Text('Please select'), // Add a hint to show before selecting an option
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOption = newValue;
                    });
                  },
                  style: TextStyle(color: kthirdColor), // Set the text color of the selected option
                  underline: Container(
                    height: 2,
                    color: kthirdColor, // Set the underline color
                  ),
                  dropdownColor: Colors.white, // Set the dropdown background color
                  items: <String?>['Please select', 'Local', 'Intercity'] // Include the hint in the dropdown items
                      .map<DropdownMenuItem<String>>((String? value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value ?? '', style: TextStyle(color: kthirdColor)), // Set the text color of dropdown items
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16),

            //ya se
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Local Travel',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ktextColor),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                            gapPadding: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Intercity Travel',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ktextColor),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                            gapPadding: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16), // Add some space between the rows
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Lodging Amount',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ktextColor),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                            gapPadding: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Meal Amount',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ktextColor),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                            gapPadding: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Other Expenses',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ktextColor),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                            gapPadding: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16), // Add some space between the rows
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle button press
                  },
                  icon: Icon(Icons.upload), // Icon to be displayed
                  label: Text('Upload Screenshot'), // Text to be displayed
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: expenseForm(),
  ));
}
