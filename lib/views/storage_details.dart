import 'package:fastgrao_hackagrao2022/views/confirm_schedule.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import '../models/Storage.dart';

class StorageDetails extends StatefulWidget {
  Storage storage;
  DateTime query_date;
  StorageDetails({Key? key, required this.storage, required this.query_date}) : super(key: key);

  @override
  State<StorageDetails> createState() => _StorageDetailsState();
}

class _StorageDetailsState extends State<StorageDetails> {
  late DateTime _startAtAsTime;
  late DateTime _filterDate;

  @override
  void initState() {
    _startAtAsTime = _calcStartAsTime();
    _filterDate = widget.query_date;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.storage.name,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.info, size: 40),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Informações do Silo",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "CNPJ: ${widget.storage.cnpj}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      "Tipos de Grão: ${widget.storage.grain_types}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      "Horário de Funcionamento: ${widget.storage.startAt}h às ${widget.storage.endAt}h",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      "Armazenamento: ${widget.storage.current_capacity}/${widget.storage.max_capacity} ton",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                )
              ],
            ),
            Divider(
              thickness: 1.0,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            Text(
              "Agenda do Silo (${formatDate(_filterDate, [
                    dd,
                    "/",
                    mm,
                    "/",
                    yyyy
                  ])})",
              style: Theme.of(context).textTheme.headline6,
            ),
            Flexible(
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        height: 8,
                      ),
                  padding: const EdgeInsets.all(10.0),
                  itemCount: _calcAgendaSize(),
                  itemBuilder: (context, index) {
                    return _AgendaCard(context, index);
                  }),
            )
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _AgendaCard(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ConfirmSchedule(storage: widget.storage, scheduleDate: DateTime(_filterDate.year, _filterDate.month, _filterDate.day, _startAtAsTime.add(Duration(minutes: widget.storage.average_processes*index)).hour, _startAtAsTime.add(Duration(minutes: widget.storage.average_processes*index)).minute, 0)))
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
                  formatDate(
                      _startAtAsTime.add(Duration(
                          minutes: widget.storage.average_processes * index)),
                      [HH, ":", nn]),
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(
                  "Disponível",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ],
          ),
        )));
  }

  int _calcAgendaSize() {
    int startAtInt = (int.parse(widget.storage.startAt[0]) * 10 +
                int.parse(widget.storage.startAt[1])) *
            60 +
        int.parse(widget.storage.startAt[3]) * 10 +
        int.parse(widget.storage.startAt[4]);
    int endAtInt = (int.parse(widget.storage.endAt[0]) * 10 +
                int.parse(widget.storage.endAt[1])) *
            60 +
        int.parse(widget.storage.endAt[3]) * 10 +
        int.parse(widget.storage.endAt[4]);
    return ((endAtInt - startAtInt) ~/ widget.storage.average_processes);
  }

  DateTime _calcStartAsTime() {
    return DateTime(
        2022,
        1,
        1,
        int.parse(widget.storage.startAt[0]) * 10 +
            int.parse(widget.storage.startAt[1]),
        int.parse(widget.storage.startAt[3]) * 10 +
            int.parse(widget.storage.startAt[4]),
        0);
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
        _filterDate = pickedDate;
      });
    }
  }
}
