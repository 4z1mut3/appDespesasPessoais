import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main()=> runApp(ExpansesApp());

class ExpansesApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
 
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final _transactions = [
    Transaction(
      id:'t1',
      date: DateTime.now(),
      title: 'Tenis novo',
      value:250.25, 
    ),
    Transaction(
      id:'t2',
      date: DateTime.now(),
      title: 'Conta de luz',
      value:310.25, 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        backgroundColor: Colors.deepPurple,
        
      ),
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(            
            child: Card(
              elevation: 5,
              color: Colors.deepPurple,
              child:Text('graficos')
            ),
          ),
          Column(
            children: _transactions.map((tr){
              return Card(
                child: Row(
                children: <Widget>[
                  Container(
                    margin:EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical:10
                    ),
                    decoration: BoxDecoration(                      
                      border: Border.all(
                        color: Colors.deepPurple,
                        width: 2,                        
                      ),                    
                    ),
                    padding: EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}' ,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepPurple
                        ),
                      ),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[                      
                      Text(
                        tr.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        DateFormat('d MMM y').format(tr.date),
                        style: TextStyle(
                          color: Colors.grey 
                        ),                        
                      ),
                    ],
                  ),
                ],
                ),
              );
            }).toList()
            ),       
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller:titleController,
                      decoration: InputDecoration(
                        labelText: 'Título',                        
                      ),
                    ),
                    TextField(
                      controller: valueController,
                      decoration: InputDecoration(
                        labelText: 'Valor (R\$)'
                      ),                      
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          child: Text('Nova Transação'),
                          textColor: Colors.deepPurple,
                          onPressed: (){
                            print(titleController.text);
                            print(valueController.text);
                          },                       
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),   
        ],
      ),
    );
  }
}