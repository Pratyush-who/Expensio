import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx, {super.key});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amtController = TextEditingController();
  DateTime? selectedDate;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmt = double.tryParse(amtController.text) ?? -1;

    if (enteredTitle.isEmpty || enteredAmt <= 0 || selectedDate == null) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmt, selectedDate);
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
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
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: amtController,
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? 'No date chosen!'
                          : 'PickedDate: ${DateFormat.yMd().format(selectedDate!)}',
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: presentDatePicker,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitData,
              child: const Text('ADD Transaction'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
