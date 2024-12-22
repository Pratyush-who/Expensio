import 'package:flutter/material.dart';
import '../MODEL/transaction.dart';
import 'package:intl/intl.dart';

class Transaction_List extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const Transaction_List(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No data inputted yet..!!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 290,
                  child: Image.asset(
                    'assets/images/removebg.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: Container(
                      width: 80, 
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(
                            15), 
                      ),
                      child: Center(
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMd().format(transactions[index].date),
                      style: const TextStyle(
                        color: Color.fromRGBO(27, 18, 17, 0.466),
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () => deleteTx(transactions[index].id),
                        icon: Icon(
                          Icons.delete_rounded,
                          size: 30,
                          color: Colors.red,
                        )),
                  ),
                );
              },
            ),
    );
  }
}
