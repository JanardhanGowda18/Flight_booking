import 'package:flutter/material.dart';
import 'flight_details_screen.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  DateTime? _departureDate;
  DateTime? _returnDate;
  String _tripType = 'One Way';

  void _selectDepartureDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (selectedDate != null) {
      setState(() {
        _departureDate = selectedDate;
      });
    }
  }

  void _selectReturnDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (selectedDate != null) {
      setState(() {
        _returnDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flight Search', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                      image: NetworkImage('assets/images/image 88217.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(1.0),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTripTypeChip('Round Trip'),
                      _buildTripTypeChip('One Way'),
                      _buildTripTypeChip('Multi-City'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildTextField(_fromController, 'From', Icons.flight_takeoff),
                  const SizedBox(height: 10),
                  _buildTextField(_toController, 'To', Icons.flight_land),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildInputDecorator('Travellers', '1 Passenger', Icons.person),
                      const SizedBox(width: 10),
                      _buildInputDecorator('Cabin Class', 'Economy', Icons.airline_seat_recline_normal),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildDateSelector('Departure Date', _departureDate, _selectDepartureDate),
                      const SizedBox(width: 10),
                      _buildDateSelector('Return Date', _returnDate, _selectReturnDate),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  FlightBookingScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Search Flights',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Travel Inspirations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TravelInspirationCard(imageUrl: 'assets/images/Rectangle 2720.png'),
                  const SizedBox(width: 8.0),
                  TravelInspirationCard(imageUrl: 'assets/images/Rectangle 2720 (1).png'),
                  const SizedBox(width: 8.0),
                  TravelInspirationCard(imageUrl: 'assets/images/Rectangle 2720 (1).png'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Flight & Hotel Packages',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FlightHotelPackageCard(imageUrl: 'assets/images/Group 1000006030.png'),
                  const SizedBox(width: 8.0),
                  FlightHotelPackageCard(imageUrl: 'assets/images/Group 1000006030.png'),
                  const SizedBox(width: 8.0),
                  FlightHotelPackageCard(imageUrl: 'assets/images/Group 1000006030.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTripTypeChip(String type) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _tripType = type;
        });
      },
      child: Chip(
        label: Text(
          type,
          style: TextStyle(
            color: _tripType == type ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: _tripType == type ? Colors.green : Colors.grey.shade300,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildInputDecorator(String labelText, String valueText, IconData icon) {
    return Expanded(
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
        child: Text(valueText, style: const TextStyle(color: Colors.black)),
      ),
    );
  }

  Widget _buildDateSelector(String labelText, DateTime? date, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: const Icon(Icons.calendar_today),
            border: const OutlineInputBorder(),
          ),
          child: Text(
            date != null ? '${date.day}/${date.month}/${date.year}' : 'Select Date',
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class TravelInspirationCard extends StatelessWidget {
  final String imageUrl;

  const TravelInspirationCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FlightHotelPackageCard extends StatelessWidget {
  final String imageUrl;

  const FlightHotelPackageCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
