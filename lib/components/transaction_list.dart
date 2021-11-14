import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
    final void Function(String) onRemove;

  TransactionList(this.transactions,this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: transactions.isEmpty ? Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Text(
            'Você ainda não registrou suas transações!',
            style: Theme.of(context).textTheme.headline6,            
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            child: Image.asset(
              'assets/images/money.png',
              fit: BoxFit.scaleDown,
              height: 130,

            ),
          )
        ],
      ): ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return Card(
            elevation: 6,
            margin: EdgeInsets.symmetric(
              vertical:5,
              horizontal: 10,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: FittedBox(
                    child: Text('R\$${tr.value}'),
                  ),
                ),
              ),
              title: Text(
                tr.title,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed:() => onRemove(tr.id),
                color: Colors.red,
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(tr.date),
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 13
                ),
              ),
              ),    
          );
        },
      ),
    );
  }
}
