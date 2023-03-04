import 'package:doctor_booking/widgets/about_doctor.dart';
import 'package:doctor_booking/widgets/appbar.dart';
import 'package:doctor_booking/widgets/button.dart';
import 'package:doctor_booking/widgets/detail_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key}) : super(key: key);
  // final Map<String, dynamic> doctor;
  // final bool isFav;

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  Map<String, dynamic> doctor = {};
  bool isFav = false;

  final Doctor doctorDetails = Doctor(
    name: 'John Doe',
    category: 'Cardiologist',
    experience: '10 years',
    patients: 100,
  );

  @override
  void initState() {
    doctor = doctor;
    isFav = isFav;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          appTitle: 'Doctor Details',
          icon: const FaIcon(Icons.arrow_back_ios),
          actions: [
            IconButton(
              onPressed: () async {},
              icon: FaIcon(
                isFav ? Icons.favorite_rounded : Icons.favorite_outline,
                color: Colors.red,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Column(
            children: <Widget>[
              AboutDoctor(
                doctor: AboutDoc(
                  name: 'Dr. John Doe',
                  education:
                      'MBBS (International Medical University, Malaysia), MRCP (Royal College of Physicians, United Kingdom)',
                  hospital: 'Sarawak General Hospital',
                  avatarImageUrl: 'assets/images/ken.png',
                ),
              ),
              const Divider(),
              DetailBody(doctorDetails: doctorDetails),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Button(
                  width: double.infinity,
                  title: 'Book Appointment',
                  onPressed: () {
                    Navigator.pushNamed(context, "book_page");
                  },
                  disable: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
