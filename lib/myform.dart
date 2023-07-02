import 'package:flutter/material.dart';

String selectedOption = "Apple";
int selectedRadio = 1;

class MyForm extends StatefulWidget {
  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email)),
            ),
            SizedBox(
              height: 16,
            ),
            DropdownButton<String>(
              value: selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
              items: ['Apple', 'Samsung', 'Nokia', 'Blackberry'].map((String option) {
                return DropdownMenuItem(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              isExpanded: true,
              hint: Text('Select a Brand'),
              icon: Icon(Icons.keyboard_arrow_down),
            ),
            SizedBox(
              height: 16,
            ),
            Text('Select your Gender'),
            RadioListTile(
                title: Text('Male'),
                value: 1,
                groupValue: selectedRadio,
                onChanged: (int? value) {
                  setState(() {
                    selectedRadio = value ?? 1;
                  });
                }),
            RadioListTile(
                title: Text('Female'),
                value: 2,
                groupValue: selectedRadio,
                onChanged: (int? value) {
                  setState(() {
                    selectedRadio = value ?? 1;
                  });
                }),
            RadioListTile(
                title: Text('Others'),
                value: 3,
                groupValue: selectedRadio,
                onChanged: (int? value) {
                  setState(() {
                    selectedRadio = value ?? 1;
                  });
                }),
            ElevatedButton(
              onPressed: () {
                submitForm(this.context);
              },
              child: Text('Register'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void submitForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Success'),
        content: Text('Saved Successfully'),
        actions: [
          ElevatedButton(onPressed: () {}, child: Text("Back")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => MyExpansion())));
              },
              child: Text("Next")),
        ],
      );
    },
  );
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class MyExpansion extends StatefulWidget {
  const MyExpansion({super.key});

  @override
  State<MyExpansion> createState() => _MyExpansionState();
}

class _MyExpansionState extends State<MyExpansion> {
  List<Item> _items = generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Brands'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _items[index].isExpanded = !isExpanded;
              });
            },
            children: _items.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(item.headerValue),
                  );
                },
                body: ListTile(
                  title: Text(item.expandedValue),
                ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

List<Item> generateItems(int count) {
  return List<Item>.generate(count, (int index) {
    return Item(
      headerValue: 'Brand $index',
      expandedValue: 'This is a description of brand number $index',
    );
  });
}