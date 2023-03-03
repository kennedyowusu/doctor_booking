import 'package:flutter/material.dart';

class TopDoctorsCardHolder extends StatelessWidget {
  const TopDoctorsCardHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: Config.heightSize * 0.35,
      child: Column(
        children: [
          for (int i = 0; i < 5; i++)
            Card(
              margin: const EdgeInsets.only(bottom: 15.0),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            // backgroundImage:
                            //     AssetImage('assets/profile1.jpg'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'name',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'category',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_outline_sharp,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "4.5",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
