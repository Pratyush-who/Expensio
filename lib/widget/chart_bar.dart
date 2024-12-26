import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double singleAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.singleAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, Constraints) {
        return Column(
          children: [
            Container(
              height: Constraints.maxHeight * .15,
              child: FittedBox(
                child: Text('\$${singleAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              height: Constraints.maxHeight * .05,
            ),
            Container(
              height: Constraints.maxHeight * .6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 144, 144, 144),
                          width: 1.0),
                      color: Color.fromRGBO(190, 190, 190, 1),
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Constraints.maxHeight * .05,
            ),
            Container(
                height: Constraints.maxHeight * .15,
                child: FittedBox(child: Text(label),),),
          ],
        );
      },
    );
  }
}
