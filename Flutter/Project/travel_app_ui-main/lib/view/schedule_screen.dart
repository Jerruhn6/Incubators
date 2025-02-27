import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travel_app/model/all_list.dart';


class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {

  AllList obj=AllList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
        
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.transparent,
                  size: 35,
                ),
                const Spacer(),
                Text(
                  "Schedule",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        const Icon(
                          Icons.notifications_none_outlined,
                          size: 25,
                        ),
                        Positioned(
                          right: 4,
                          top: 5,
                          child: Container(
                            alignment: Alignment.center,
                            height: 7,
                            width: 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: DateTime.now(),
                rowHeight: 60,
                daysOfWeekHeight: 20,
                calendarFormat: CalendarFormat.week,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    // _selectedDay = selectedDay;
                    // _focusedDay = focusedDay;
                  });
                },
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,

                  disabledTextStyle: TextStyle(
                    fontSize: 16, // Text color of selected date

                    fontWeight: FontWeight.w500,
                  ),

                  //isTodayHighlighted: false,
                  todayDecoration: BoxDecoration(
                    color: Color.fromRGBO(13, 110, 253, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),

                  // 🟡 Today's date style
                  selectedDecoration: BoxDecoration(
                    color: Color.fromRGBO(13, 110, 253, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    //shape: BoxShape.rectangle,
                  ),
                  todayTextStyle: TextStyle(
                    color: Colors.white, // Text color for today
                    fontWeight: FontWeight.w500,
                  ),

                  // 🔵 Default day style (when not selected)
                  defaultTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  selectedTextStyle: TextStyle(
                    color: Colors.white, // Text color of selected date

                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "My Schedule",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  "View all",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(13, 110, 253, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: obj.mySheduleList.length,
                itemBuilder: (context,index){
                  return  Container(
                      height: 102,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            height: 80,
                            width: 80,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Image.asset(
                              obj.mySheduleList[index]["image"],
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                               // spacing: 5,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.grey.shade400,
                                    size: 18,
                                  ),
                                  Text(
                                   obj.mySheduleList[index]["date"],
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade400),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                   obj.mySheduleList[index]["desName"],
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                //spacing: 5,
                                children: [
                                  Icon(
                                    Icons.place_outlined,
                                    color: Colors.grey.shade400,
                                    size: 18,
                                  ),
                                  Text(
                                    obj.mySheduleList[index]["location"],
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey.shade500,
                            size: 15,
                          ),
                        ],
                      ),
                    );
                },
                )
            ),
          ],
        ),
      ),
    );
  }
}