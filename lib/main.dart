import 'package:doctor_booking/layout.dart';
import 'package:doctor_booking/utils/config.dart';
import 'package:doctor_booking/view/auth/auth.dart';
import 'package:doctor_booking/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Appointment Booking',
      transitionDuration: Duration(milliseconds: 500),
      defaultTransition: Transition.fade,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {
        // '/': (context) => const AuthSelector(),
        '/': (context) => const MainLayout(),
        'main': (context) => const MainLayout(),
        // 'booking_page': (context) => BookingPage(),
        // 'success_booking': (context) => const AppointmentBooked(),
      },
    );
  }
}
