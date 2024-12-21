import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx, {super.key});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amtController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmt = double.tryParse(amtController.text) ?? -1;

    if (enteredTitle.isEmpty || enteredAmt <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmt);
    Navigator.of(context).pop(); // Close modal
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Enter Title'),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Enter Amount'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              controller: amtController,
              onSubmitted: (_) => submitData(),
            ),
            ElevatedButton(
              onPressed: submitData,
              child: const Text('ADD Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
