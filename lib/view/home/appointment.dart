import 'package:doctor_booking/utils/config.dart';
import 'package:doctor_booking/widgets/schedule.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  ScheduleStatus status = ScheduleStatus.upcoming; //initial status
  Alignment _alignment = Alignment.centerLeft;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List<dynamic> filteredSchedules = schedules.where((var schedule) {
    //   // switch (schedule['status']) {
    //   //   case 'upcoming':
    //   //     schedule['status'] = FilterStatus.upcoming;
    //   //     break;
    //   //   case 'complete':
    //   //     schedule['status'] = FilterStatus.complete;
    //   //     break;
    //   //   case 'cancel':
    //   //     schedule['status'] = FilterStatus.cancel;
    //   //     break;
    //   // }
    //   return schedule['status'] == status;
    // }).toList();

    List<Schedule> filteredSchedules = schedules.where((schedule) {
      return schedule.status == status;
    }).toList();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //this is the filter tabs
                      for (ScheduleStatus filterStatus in ScheduleStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              debugPrint("onTap called");
                              setState(() {
                                switch (filterStatus) {
                                  case ScheduleStatus.upcoming:
                                    status = ScheduleStatus.upcoming;
                                    _alignment = Alignment.centerLeft;
                                    break;
                                  case ScheduleStatus.complete:
                                    status = ScheduleStatus.complete;
                                    _alignment = Alignment.center;
                                    break;
                                  case ScheduleStatus.cancel:
                                    status = ScheduleStatus.cancel;
                                    _alignment = Alignment.centerRight;
                                    break;
                                }
                                debugPrint(
                                  "status: $status, _alignment: $_alignment",
                                );
                              });
                            },
                            child: Center(
                              child: Text(filterStatus.name),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context, index) {
                  Schedule schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: !isLastElement
                        ? const EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    schedule.doctorName,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    schedule.specialty,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // ScheduleCard(
                          //   date: schedule['date'],
                          //   day: schedule['day'],
                          //   time: schedule['time'],
                          // ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Cancel',
                                    style:
                                        TextStyle(color: Config.primaryColor),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Config.primaryColor,
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Reschedule',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
