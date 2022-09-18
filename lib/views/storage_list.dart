/*
* This file implements the main Storage List Screen
* where the user will be able to see available storages
* close to his location.
*
* By default, the list shows storages with availability on
* the current date. The user can then input a new date on the
* date picker to see availability in a different date.
* */

import 'package:fastgrao_hackagrao2022/views/storage_details.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import '../models/Storage.dart';

class StorageList extends StatefulWidget {
  const StorageList({Key? key}) : super(key: key);

  @override
  State<StorageList> createState() => _StorageListState();
}

class _StorageListState extends State<StorageList> {
  List<Storage> storages = [
    Storage(1, "Silo Alfa", "XX.XXX.XXX/0001-XX", "(34)3315-2451",
        "Sorgo, Milho", "07:30", "20:00", 15, 100000, 20000, 20000),
    Storage(1, "Silo Beta", "XX.XXX.XXX/0001-XX", "(34)3224-6294", "Soja",
        "05:00", "18:00", 20, 75000, 47500, 47500),
    Storage(1, "Silo Gamma", "XX.XXX.XXX/0001-XX", "(34)3665-9421", "Milho",
        "06:00", "19:00", 10, 120000, 80700, 80700),
    Storage(1, "Silo Theta", "XX.XXX.XXX/0001-XX", "(34)3121-1542",
        "Sorgo, Milho, Soja", "08:00", "18:00", 30, 40000, 10000, 10000),
    Storage(1, "Silo Alfa", "XX.XXX.XXX/0001-XX", "(34)3315-2451",
        "Sorgo, Milho", "07:00", "20:00", 15, 100000, 20000, 20000),
    Storage(1, "Silo Beta", "XX.XXX.XXX/0001-XX", "(34)3224-6294", "Soja",
        "05:00", "18:00", 20, 75000, 47500, 47500),
    Storage(1, "Silo Gamma", "XX.XXX.XXX/0001-XX", "(34)3665-9421", "Milho",
        "06:00", "19:00", 10, 120000, 80700, 80700),
    Storage(1, "Silo Theta", "XX.XXX.XXX/0001-XX", "(34)3121-1542",
        "Sorgo, Milho, Soja", "08:00", "18:00", 30, 40000, 10000, 10000),
    Storage(1, "Silo Alfa", "XX.XXX.XXX/0001-XX", "(34)3315-2451",
        "Sorgo, Milho", "07:00", "20:00", 15, 100000, 20000, 20000),
    Storage(1, "Silo Beta", "XX.XXX.XXX/0001-XX", "(34)3224-6294", "Soja",
        "05:00", "18:00", 20, 75000, 47500, 47500),
    Storage(1, "Silo Gamma", "XX.XXX.XXX/0001-XX", "(34)3665-9421", "Milho",
        "06:00", "19:00", 10, 120000, 80700, 80700),
    Storage(1, "Silo Theta", "XX.XXX.XXX/0001-XX", "(34)3121-1542",
        "Sorgo, Milho, Soja", "08:00", "18:00", 30, 40000, 10000, 10000),
  ];
  TextEditingController _filterDateTextController = TextEditingController();
  DateTime filterDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    _filterDateTextController.text =
        formatDate(filterDate, [dd, "/", mm, "/", yyyy]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("FastGrao",
            style: TextStyle(
                fontSize: 20.0,
                color: Theme.of(context).colorScheme.onPrimary)),
        actions: const [
          Image(
            image: AssetImage('assets/fastgraoicon.png'),
          ),
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
                  Text(
                    "Disponibilidade de silos em: ",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(_filterDateTextController.text,
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
            ),
            Divider(
              thickness: 1.0,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            Flexible(
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        height: 8,
                      ),
                  padding: const EdgeInsets.all(10.0),
                  itemCount: storages.length,
                  itemBuilder: (context, index) {
                    if (storages[index].isHidden == false) {
                      return _StorageCard(context, index);
                    }
                    return const SizedBox
                        .shrink(); //Retorna esse "vazio" se a task estiver oculta por um filtro
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        color: Theme.of(context).colorScheme.primary,
        shape: const CircularNotchedRectangle(),
        child: IconTheme(
          data: IconThemeData(
              color: Theme.of(context).colorScheme.onPrimary, size: 35),
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
                onPressed: () {
                  //TODO implement search dialog
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _StorageCard(BuildContext context, int index) {
    return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StorageDetails(storage: storages[index], query_date: filterDate,)),
          );
        },
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.circle,
                    color: Colors.green,
                  ),
                  title: Text(
                    storages[index].name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(storages[index].grain_types),
                      Text(storages[index].phone),
                    ],
                  ),
                ),

              ],
            ),
          )
        )
    );
  }

  void _showDatePickerDialog(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        filterDate = pickedDate;
        _filterDateTextController.text =
            formatDate(pickedDate, [dd, "/", mm, "/", yyyy]);
      });
    }
  }
}
