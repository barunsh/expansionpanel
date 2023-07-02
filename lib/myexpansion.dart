import 'package:flutter/material.dart';

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
  List<Item> _items = generateItems(4); // Number of brands

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smartphone Brands'),
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
  List<String> brands = ['Apple', 'Samsung', 'Nokia', 'Blackberry'];
  List<String> descriptions = [
    'Apple Inc. is a popular company known for the iPhone.',
    'Samsung is renowned for its Galaxy series of smartphones.',
    'Nokia was the leading smartphone brand in the early 2000s.',
    'BlackBerry was commonly used in the business world due to its email features.'
  ];

  return List<Item>.generate(count, (int index) {
    return Item(
      headerValue: brands[index],
      expandedValue: descriptions[index],
    );
  });
}