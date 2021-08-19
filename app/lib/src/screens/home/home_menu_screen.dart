import 'package:app/src/screens/attendance/attendance_screen.dart';
import 'package:app/src/utils/menu.dart';
import 'package:flutter/material.dart';

class HomeMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<MenuData> menu = [
      MenuData(Icons.person, 'Profile'),
      MenuData(Icons.list, 'My Task'),
      MenuData(Icons.add_comment, 'Attendance'),
      MenuData(Icons.calendar_today, 'Leave'),
      MenuData(Icons.search, 'Employee Directory'),
      MenuData(Icons.announcement, 'Announcement'),
      MenuData(Icons.calendar_view_day, 'Upcomming'),
      MenuData(Icons.payment, 'Payslip'),
      MenuData(Icons.note, 'Critical Incident Diary'),
      MenuData(Icons.person_search, 'Recruitment'),
      MenuData(Icons.bookmark_add, 'Survey'),
    ];

    return Container(
        child: Scrollbar(
      thickness: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
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
                        if (menu[index].title == "Attendance") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AttendanceScreen()),
                          );
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
