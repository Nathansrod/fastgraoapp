/*
* This file implements the main Storage List Screen
* where the user will be able to see available storages
* close to his location.
*
* By default, the list shows storages with availability on
* the current date. The user can then input a new date on the
* date picker to see availability in a different date.
* */

import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class StorageList extends StatefulWidget {
  const StorageList({Key? key}) : super(key: key);

  @override
  State<StorageList> createState() => _StorageListState();
}

class _StorageListState extends State<StorageList> {
  TextEditingController _filterDateTextController = TextEditingController();
  DateTime filterDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    _filterDateTextController.text = formatDate(filterDate, [dd,"/",mm,"/",yyyy]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("FastGrao", style: TextStyle(fontSize: 20.0, color: Theme.of(context).colorScheme.onPrimary)),
        actions: const [
          Image(image: AssetImage('assets/fastgraoicon.png'), ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0),
              child: Column(
                children: [
                  Text("Silos disponíveis em: ", style: Theme.of(context).textTheme.headline4,),
                  Text(_filterDateTextController.text, style: Theme.of(context).textTheme.headline6),
                ],
              ),
            ),
            Divider(thickness: 1.0, color: Theme.of(context).colorScheme.onSurface,)
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.primary,
        shape: const CircularNotchedRectangle(),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary, size: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                tooltip: 'Mudar Data',
                icon: const Icon(Icons.calendar_month),
                onPressed: () {
                  _showDatePickerDialog(context);
                },
              ),
              IconButton(
                tooltip: 'Filtrar',
                icon: const Icon(Icons.filter_alt),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Pesquisar',
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget StorageCard(){
    return Card(

    );
  }

  void _showDatePickerDialog(BuildContext context) async{
    DateTime? pickedDate = await showDatePicker(
      context: context, initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),

    );

    if(pickedDate != null){
      setState(() {
        filterDate = pickedDate;
        _filterDateTextController.text = formatDate(pickedDate, [dd,"/",mm,"/",yyyy]);
      });
    }
  }
}
