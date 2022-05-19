import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';

class callLogsPage extends StatefulWidget {
  const callLogsPage({Key? key}) : super(key: key);

  @override
  State<callLogsPage> createState() => _callLogsPageState();
}

class _callLogsPageState extends State<callLogsPage> {
  late Iterable<CallLogEntry> entries;
  List<CallLogEntry> callLogsList = [];
  List<Map<String, dynamic>> fireDdata = [];

  @override
  void initState() {
    super.initState();
  }

  showContacts() async {
    // GET WHOLE CALL LOG
    entries = await CallLog.get();
    callLogsList.addAll(entries);
    setState(() {});
    fireDdata.clear();
    for (int a = 0; a < callLogsList.length; a++)
      fireDdata.add({
        'name': '${callLogsList[a].name}',
        'number': '${callLogsList[a].number}',
        'callType': '${callLogsList[a].callType}',
        'time': '${callLogsList[a].timestamp}',
        'duration': '${callLogsList[a].duration}'
      });
    print('new value ' + fireDdata.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Logs'),
      ),
      body: ListView.builder(
          itemCount: callLogsList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                onTap: () {
                  print(callLogsList[index].callType.toString());
                },
                title: Text(
                    '${callLogsList[index].name} ${callLogsList[index].number}'),
                subtitle: Text(
                    '${callLogsList[index].duration} ${callLogsList[index].timestamp} ${callLogsList[index].cachedNumberLabel}'),
                trailing: callLogsList[index].callType.toString() ==
                        'CallType.incoming'
                    ? Icon(
                        Icons.arrow_circle_down_sharp,
                        color: Colors.green,
                      )
                    : Icon(Icons.arrow_circle_up_rounded, color: Colors.red));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: showContacts,
        tooltip: 'Contacts',
        child: const Icon(Icons.perm_contact_calendar_sharp),
      ),
    );
  }
}
