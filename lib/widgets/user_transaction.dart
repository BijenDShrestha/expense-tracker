import 'dart:ffi';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserTransaction extends StatefulWidget {
  // const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 99.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Jacket', amount: 199.99, date: DateTime.now())
  ];

  void _addNewTxn(String txnTitle, double txnAmount) {
    final newTxn = Transaction(
        id: DateTime.now().toString(),
        title: txnTitle,
        amount: txnAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTxn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTxn),
        TransactionList(_userTransactions)],
    );
  }
}
