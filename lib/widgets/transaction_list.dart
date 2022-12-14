import '../models/transaction.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({Key? key}) : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTxn;

  TransactionList(this.transactions, this.deleteTxn);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: ((ctx, constraints) {
          return Column(
            children: [
              Text(
                'No Transaction added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/waiting.png',
                  // fit: BoxFit.cover,
                ),
              ),
            ],
          );
        })) 
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMEd().format(transactions[index].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTxn(transactions[index].id),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
