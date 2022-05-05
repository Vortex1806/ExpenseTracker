import 'package:flutter/material.dart';

import './new_transactions.dart';
import './transacton_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  Widget build(BuildContext context) {
    return Column(
      children:[
        NewTransaction(),
        TransactionList()
      ]
    );
  }
}
