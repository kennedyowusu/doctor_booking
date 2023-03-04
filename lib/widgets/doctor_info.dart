import 'package:doctor_booking/widgets/doctor_info_card.dart';
import 'package:flutter/material.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({Key? key, required this.patients, required this.exp})
      : super(key: key);

  final int patients;
  final int exp;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          InfoCard(
            infoLabel: 'Patients',
            infoValue: '$patients',
          ),
          const SizedBox(
            width: 15,
          ),
          InfoCard(
            infoLabel: 'Experiences',
            infoValue: '$exp years',
          ),
          const SizedBox(
            width: 15,
          ),
          const InfoCard(
            infoLabel: 'Rating',
            infoValue: '4.6',
          ),
        ],
      ),
    );
  }
}
