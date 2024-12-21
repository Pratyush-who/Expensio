import 'package:flutter/material.dart';
import '../MODEL/transaction.dart';
import 'package:intl/intl.dart';

class Transaction_List extends StatelessWidget {
  final List<Transaction> transactions;
  const Transaction_List(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No data inputted yet..!!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(height: 280,
                child: Image.asset('assets/images/removebg.png', fit: BoxFit.cover,)),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColorDark,
                            width: 3,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            DateFormat(DateFormat.YEAR_MONTH_DAY)
                                .format(transactions[index].date),
                            style: const TextStyle(
                              color: Color.fromRGBO(27, 18, 17, 0.466),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
