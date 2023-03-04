import 'package:doctor_booking/utils/config.dart';
import 'package:flutter/material.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({Key? key, required this.doctor}) : super(key: key);

  final AboutDoc doctor;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Config().init(context);
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            CircleAvatar(
              radius: 65.0,
              backgroundImage: AssetImage(
                doctor.avatarImageUrl,
              ),
              backgroundColor: Colors.grey.withAlpha(50),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            height > 600
                ? const SizedBox(
                    height: 15,
                  )
                : const SizedBox(
                    height: 10,
                  ),
            Center(
              child: Text(
                doctor.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Config.spaceSmall,
            SizedBox(
              width: Config.widthSize * 0.75,
              child: Text(
                doctor.education,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            Config.spaceSmall,
            SizedBox(
              width: Config.widthSize * 0.75,
              child: Text(
                doctor.hospital,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            height > 600
                ? const SizedBox(
                    height: 15,
                  )
                : const SizedBox(
                    height: 10,
                  ),
          ],
        ),
      ),
    );
  }
}

class AboutDoc {
  final String name;
  final String education;
  final String hospital;
  final String avatarImageUrl;

  const AboutDoc({
    required this.name,
    required this.education,
    required this.hospital,
    required this.avatarImageUrl,
  });
}
