import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class MyItem {
  bool isExpanded;
  String header;
  Widget body;

  MyItem(this.isExpanded, this.header, this.body);
}

class _MyAppState extends State<MyApp> {
  List<MyItem> _items = [];
  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      _items.add(MyItem(
          false,
          'Item ${i}',
          Container(
            padding: const EdgeInsets.all(15.0),
            child: const Text('Hello World'),
          )));
    }
  }

  ExpansionPanel _createitem(MyItem item) {
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Container(
            padding: const EdgeInsets.all(5.0),
            child: Text('Header ${item.header}'),
          );
        },
        body: item.body,
        isExpanded: item.isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expanded"),
        ),
        body: Container(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _items[index].isExpanded = !_items[index].isExpanded;
                  });
                },
                children: _items.map(_createitem).toList(),
              )
            ],
          ),
        ));
  }
}
