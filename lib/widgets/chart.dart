import 'package:expense_tracker/widgets/chart_bar.dart';

import '../models/transaction.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  // const Chart({Key? key}) : super(key: key);

  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
      return List.generate(7, (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));

        double totalSum = 0.0;

        for(var i=0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay.day &&
          recentTransactions[i].date.month == weekDay.month &&
          recentTransactions[i].date.year == weekDay.year) 
          {
            totalSum += recentTransactions[i].amount;
          }
        }

        print(DateFormat.E().format(weekDay));
        print(totalSum);

        return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        // children: groupedTransactionValues.map((data) => Text('${data['day']}: ${data['amount']}'))
        // .toList(),
        children: 
          groupedTransactionValues.map((data) => ChartBar(data['day'].toString(), 
          double.parse(data['amount'].toString()), 
          0.5)).toList()
      ),
    );
  }
}