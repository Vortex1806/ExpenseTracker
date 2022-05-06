import 'package:flutter/material.dart';

import './widgets/new_transactions.dart';
import './models/transaction.dart';
import 'widgets/transacton_list.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void startNewAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              child: NewTransaction(_addNewTransaction),
              behavior: HitTestBehavior.opaque);
        });
  }

  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'Petrol', amount: 300, date: DateTime.now()),
    Transaction(id: 't2', title: 'Groceries', amount: 200, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
              onPressed: () {
                startNewAddTransaction(context);
              },
              icon: Icon(Icons.add))
        ],
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
            TransactionList(_userTransactions)
          ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startNewAddTransaction(context);
        },
      ),
    );
  }
}
