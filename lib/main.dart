import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'Petrol', amount: 300, date: DateTime.now()),
    Transaction(id: 't2', title: 'Groceries', amount: 200, date: DateTime.now())
  ];

  // String titleinput;
  // String amountinput;

  final titlecontroller = TextEditingController();
  final amountcotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Chart!'),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      enableSuggestions: true,
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titlecontroller,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: amountcotroller,
                    ),
                    FlatButton(
                        child: Text('Add Transaction'),
                        textColor: Colors.purple,
                        onPressed: () {
                          print(titlecontroller.text);
                          print(amountcotroller.text);
                        }),
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2),
                        ),
                        child: Text(
                          '₹ ${tx.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMMMMd().format(tx.date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ]),
    );
  }
}
