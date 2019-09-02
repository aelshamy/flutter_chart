import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': 9.99 * (index + 5),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((item) {
            final amount = item['amount'].toStringAsFixed(1);
            return Flexible(
              child: Column(
                children: <Widget>[
                  FittedBox(child: Text('\$$amount')),
                  SizedBox(height: 4),
                  Container(
                    height: 150,
                    width: 10,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        FractionallySizedBox(
                          heightFactor: (item['amount'] as double) / 150,
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
                  SizedBox(height: 4),
                  Text('${item['day']}'),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
