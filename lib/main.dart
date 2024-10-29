import 'package:flutter/material.dart';
import 'screens/flight_search_screen.dart';

void main() {
  runApp(FlightBookingApp());
}

class FlightBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Booking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlightSearchScreen(),
    );
  }
}
