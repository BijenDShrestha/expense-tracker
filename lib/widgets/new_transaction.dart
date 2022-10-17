import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewTransaction extends StatelessWidget {
  // const NewTransaction({Key? key}) : super(key: key);

  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    // onChanged: (value) {titleInput = value;},
                    controller: titleController,
                    onSubmitted: (_) => submitData(),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    // onChanged: (value) => amountInput = value,
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => submitData(),
                  ),
                  FlatButton(
                    onPressed: 
                      // print(titleController.text);
                      // print(amountController.text);
                      submitData,
                    child: Text(
                      'Add Transaction',
                      style: TextStyle(color: Colors.purple),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(enteredTitle, 
    enteredAmount);
  }
}