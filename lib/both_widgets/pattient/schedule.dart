import 'package:flutter/material.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  _ScheduleWidgetState createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Card(
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Text('Dr Name'),
                subtitle: Wrap(
                  direction: Axis.vertical,
                  spacing: 5, // to apply margin in the main axis of the wrap
                  children: [
                    Text('Field'),
                    Text('Cost'),
                  ],
                ),
                trailing: CircleAvatar(),
              ),
            ),
            Divider(
              color: Colors.black,
              endIndent: 10,
              indent: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Date'),
                Text('Time'),
                ElevatedButton(onPressed: null, child: Text('Cancel'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
