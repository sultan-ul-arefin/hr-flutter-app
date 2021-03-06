import 'package:app/src/screens/leave/leave_balance_screen.dart';
import 'package:app/src/utils/menu.dart';
import 'package:flutter/material.dart';

class LeaveMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<MenuData> menu = [
      MenuData(Icons.directions_walk, 'Leave Application'),
      MenuData(Icons.assignment_turned_in, 'Leave Approval'),
      MenuData(Icons.next_week, 'Compensatory Leave Certificate'),
    ];
    return Container(
        child: Scrollbar(
      thickness: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: menu.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.all(5.0),
                    elevation: 0.2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: InkWell(
                      onTap: () {
                        switch (menu[index].title) {
                          case "Leave Application":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LeaveBalanceScreen()),
                            );
                            break;
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(menu[index].icon, size: 60, color: Colors.black),
                          SizedBox(height: 10),
                          Text(
                            menu[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
