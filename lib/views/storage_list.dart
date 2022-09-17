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

class StorageList extends StatefulWidget {
  const StorageList({Key? key}) : super(key: key);

  @override
  State<StorageList> createState() => _StorageListState();
}

class _StorageListState extends State<StorageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("FastGrao", style: TextStyle(fontSize: 20.0, color: Theme.of(context).colorScheme.onPrimary)),
        actions: [
          Image(image: AssetImage('assets/fastgraoicon.png'), ),
        ],

      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }

  Widget StorageCard(){
    return Card(

    );
  }
}
