import './widgets/new_transaction.dart';

import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Expense Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String titleInput = "";
  // String amountInput = "";


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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return NewTransaction(_addNewTxn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [IconButton(onPressed: () => _startAddNewTransaction(context), icon: Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
        ),
    );
  }
}
