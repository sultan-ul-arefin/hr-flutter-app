import 'package:flutter/material.dart';

class LeaveApplicationForm extends StatefulWidget {
  const LeaveApplicationForm({Key key}) : super(key: key);

  @override
  _LeaveApplicationFormState createState() => _LeaveApplicationFormState();
}

class _LeaveApplicationFormState extends State<LeaveApplicationForm> {
  String date = "";
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(5),
        child: Scrollbar(
          thickness: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Text('chk'),
                        ),
                      ]),
                      Column(children: [
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Text('Leave type'),
                        ),
                      ]),
                      Column(children: [
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Text('Opening', textAlign: TextAlign.center),
                        ),
                      ]),
                      Column(children: [
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Text('Consume', textAlign: TextAlign.center),
                        ),
                      ]),
                      Column(children: [
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Text('Balance', textAlign: TextAlign.center),
                        ),
                      ]),
                    ]),
                    TableRow(children: [
                      Radio(),
                      Text(
                        "Casual Leave",
                        textAlign: TextAlign.center,
                      ),
                      Text("10", textAlign: TextAlign.center),
                      Text("2", textAlign: TextAlign.center),
                      Text("8", textAlign: TextAlign.center),
                    ]),
                    TableRow(children: [
                      Radio(),
                      Text(
                        "Casual Leave",
                        textAlign: TextAlign.center,
                      ),
                      Text("10", textAlign: TextAlign.center),
                      Text("2", textAlign: TextAlign.center),
                      Text("8", textAlign: TextAlign.center),
                    ]),
                    TableRow(children: [
                      Radio(),
                      Text(
                        "Casual Leave",
                        textAlign: TextAlign.center,
                      ),
                      Text("10", textAlign: TextAlign.center),
                      Text("2", textAlign: TextAlign.center),
                      Text("8", textAlign: TextAlign.center),
                    ]),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [Radio(), Text("Half Day")],
                      ),
                      Row(
                        children: [Radio(), Text("One Day")],
                      ),
                      Row(
                        children: [Radio(), Text("Multi-Days")],
                      )
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Text("From Date"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Text("To Date"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Duty will be covered by :"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Emp ID',
                          hintText: 'Emp ID',
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                          hintText: 'Name',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Leave reason :"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Reason',
                          hintText: 'Reason',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [Radio(), Text("Draft")],
                      ),
                      Row(
                        children: [Radio(), Text("Submit")],
                      )
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print("Save");
                      },
                      child: Text("Cancle"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("Save");
                      },
                      child: Text("Draft/Submit"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2025),
        initialEntryMode: DatePickerEntryMode.input);
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }
}
