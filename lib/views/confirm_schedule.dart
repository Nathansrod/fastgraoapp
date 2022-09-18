import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import '../models/Storage.dart';

class ConfirmSchedule extends StatefulWidget {
  Storage storage;
  DateTime scheduleDate;
  ConfirmSchedule({Key? key, required this.storage, required this.scheduleDate}) : super(key: key);

  @override
  State<ConfirmSchedule> createState() => _ConfirmScheduleState();
}

class _ConfirmScheduleState extends State<ConfirmSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Confirmar Agendamento",
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
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.access_time_filled, size: 40),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Data e hora agendada: ",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(formatDate(widget.scheduleDate, [dd,"/",mm,"/",yyyy," as ",HH,":",nn]),
                        style: Theme.of(context).textTheme.bodyText2),
                  ],
                )
              ],
            ),
            Divider(
              thickness: 1.0,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            Text(
              "Documentação do transporte: ",
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
