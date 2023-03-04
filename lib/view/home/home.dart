import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_booking/utils/config.dart';
import 'package:doctor_booking/view/home/appointment_card_holder.dart';
import 'package:doctor_booking/view/home/top_doctors_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> user = {};
  Map<String, dynamic> doctor = {};
  List<dynamic> favList = [];
  List<Map<String, dynamic>> medCat = [
    {
      "icon": FontAwesomeIcons.userDoctor,
      "specialty": "General",
    },
    {
      "icon": FontAwesomeIcons.heartPulse,
      "specialty": "Cardiology",
    },
    {
      "icon": FontAwesomeIcons.lungs,
      "specialty": "Respirations",
    },
    {
      "icon": FontAwesomeIcons.hand,
      "specialty": "Dermatology",
    },
    {
      "icon": FontAwesomeIcons.personPregnant,
      "specialty": "Gynecology",
    },
    {
      "icon": FontAwesomeIcons.teeth,
      "specialty": "Dental",
    },
  ];

  List items = [
    'iTEM 1',
    'iTEM 2',
    'iTEM 3',
    'ITEM 4',
    'ITEM 5',
  ];

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return SafeArea(
      child: Scaffold(
        //if user is empty, then return progress indicator
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'name',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      child: CircleAvatar(
                        radius: 30,
                        // backgroundImage:
                        //     AssetImage('assets/profile1.jpg'),
                      ),
                    )
                  ],
                ),
                Config.spaceMedium,
                const Text(
                  'Specialty',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Config.spaceSmall,
                SizedBox(
                  height: Config.heightSize * 0.05,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(medCat.length, (index) {
                      return Card(
                        margin: const EdgeInsets.only(right: 20),
                        color: Config.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              FaIcon(
                                medCat[index]['icon'],
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                medCat[index]['specialty'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Config.spaceSmall,
                const Text(
                  'Appointment',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                AppointmentCardHolder(items: items),
                // doctor.isNotEmpty
                Config.spaceSmall,
                Text(
                  'Top Doctors',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Config.spaceSmall,
                TopDoctorsCardHolder(
                  routeName: 'doctor_details',
                ),
                Config.spaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
