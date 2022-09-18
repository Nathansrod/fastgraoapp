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

  @override
  void initState() {
    _startAtAsTime = _calcStartAsTime();
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
            Text(
              "Dados do Silo",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 5.0,),
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
            Divider(
              thickness: 1.0,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            Text(
              "Agenda do Silo (${formatDate(widget.query_date, [dd, "/", mm, "/", yyyy])})",
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
    );
  }

  Widget _AgendaCard(BuildContext context, int index) {
    return GestureDetector(
        onTap: (){},
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
                      formatDate(_startAtAsTime.add(Duration(minutes: widget.storage.average_processes*index)), [HH,":",nn]),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text("Disponível", style: Theme.of(context).textTheme.caption,),
                  ),
                ],
              ),
            )
        )
    );
  }

  int _calcAgendaSize(){
    int startAtInt = (int.parse(widget.storage.startAt[0])*10 + int.parse(widget.storage.startAt[1]))*60 + int.parse(widget.storage.startAt[3])*10 + int.parse(widget.storage.startAt[4]);
    int endAtInt = (int.parse(widget.storage.endAt[0])*10 + int.parse(widget.storage.endAt[1]))*60 + int.parse(widget.storage.endAt[3])*10 + int.parse(widget.storage.endAt[4]);
    print("${startAtInt}, ${endAtInt}, ${((endAtInt - startAtInt)~/widget.storage.average_processes)}");
    return ((endAtInt - startAtInt)~/widget.storage.average_processes);
  }

  DateTime _calcStartAsTime(){
    return DateTime(2022, 1, 1, int.parse(widget.storage.startAt[0])*10 + int.parse(widget.storage.startAt[1]), int.parse(widget.storage.startAt[3])*10 + int.parse(widget.storage.startAt[4]), 0);
  }
}
