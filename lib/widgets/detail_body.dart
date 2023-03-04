import 'package:doctor_booking/utils/config.dart';
import 'package:doctor_booking/widgets/doctor_info.dart';
import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String category;
  final String experience;
  final int patients;

  Doctor({
    required this.name,
    required this.category,
    required this.experience,
    required this.patients,
  });
}

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key, required this.doctorDetails}) : super(key: key);
  final Doctor doctorDetails;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 100,
          child: Padding(
            padding: EdgeInsets.only(left: 12.0, right: 12.0),
            child: DoctorInfo(
              patients: doctorDetails.patients,
              exp: doctorDetails.experience.length,
            ),
          ),
        ),
        Config.spaceMedium,
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'About Doctor',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Dr. ${doctorDetails.name} is an experienced ${doctorDetails.category} Specialist at Sarawak, graduated since 2008, and completed his/her training at Sungai Buloh General Hospital.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}
