import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titlecontroller = TextEditingController();
  final amountcotroller = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titlecontroller.text;
    final enteredAmount = double.parse(amountcotroller.text);
    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }

    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountcotroller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.purple,
                onPressed: () {
                  submitData();
                }),
          ],
        ),
      ),
    );
  }
}
