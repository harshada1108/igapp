import 'package:flutter/material.dart';
import 'package:igapp/screens/homescreenui.dart';

class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  TextEditingController textFieldController = TextEditingController();
  String? selectedOption;

  final List<String> options = ['CIVIL', 'CSE', 'ARCHI', 'META','MINING','ECE','EE','MECH'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // TextField ListTile
                  ListTile(
                    title: TextField(
                      controller: textFieldController,

                      decoration: InputDecoration(
                        labelText: 'Enter Username',
                      ),
                    ),
                  ),
                  // Dropdown ListTile
                  ListTile(
                    title: DropdownButtonFormField<String>(
                      value: selectedOption,
                      hint: Text('Select Branch'),
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value;
                        });
                      },
                      items: options.map((option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                    ),
                  ),
                  // Next Button
                  ElevatedButton(
                    onPressed: () {
                      _navigateToNextScreen(context);

    }
                    ,
                    child: Text('Next'),


    )



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    String textFieldValue = textFieldController.text;
    // Do something with the selected values (textFieldValue and selectedOption)

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreenUi(
          username: textFieldValue,
          branch: selectedOption!,

        ),
      ),
    );
  }
}


