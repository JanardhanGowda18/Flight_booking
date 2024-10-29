import 'package:flutter/material.dart';


class FlightBookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Ezy Travel', style: TextStyle(fontSize: 18)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                _buildSearchSection(),
                SizedBox(height: 10),
                _buildDateSelector(),
                SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(child: _buildFlightList()),
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'BLR - Bengaluru to DXB - Dubai',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Modify Search', style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text('Departure: Sat, 23 Mar - Return: Sat, 23 Mar'),
                ),
                Text('(Round Trip)', style: TextStyle(color: Colors.orange)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildDateOption('Mar 22 - Mar 23', 'From AED 741', false),
        _buildDateOption('Mar 23 - Mar 24', 'From AED 721', true),
        _buildDateOption('Mar 24 - Mar 25', 'From AED 750', false),
      ],
    );
  }

  Widget _buildDateOption(String date, String price, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: selected ? Colors.green.shade100 : Colors.transparent,
        border: Border.all(color: selected ? Colors.green : Colors.grey),
      ),
      child: Column(
        children: [
          Text(date, style: TextStyle(color: selected ? Colors.green : Colors.black)),
          SizedBox(height: 4),
          Text(price, style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildFlightList() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildFlightCard();
      },
    );
  }

  Widget _buildFlightCard() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Onward - Garuda Indonesia',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text('AED 409', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '14:35',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.flight_takeoff, color: Colors.green),
                ),
                Expanded(
                  child: Text(
                    '21:55',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              'BLR - Bengaluru       4h 30m       DXB - Dubai',
              style: TextStyle(color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Return - Garuda Indonesia',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text('AED 359', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '21:55',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.flight_land, color: Colors.green),
                ),
                Expanded(
                  child: Text(
                    '14:35',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              'DXB - Dubai       4h 30m       BLR - Bengaluru',
              style: TextStyle(color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel('Cheapest', Colors.green.shade100, Colors.green),
                _buildLabel('Refundable', Colors.blue.shade100, Colors.blue),
                TextButton(
                  onPressed: () {},
                  child: Text('Flight Details', style: TextStyle(color: Colors.orange)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text, Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
    );
  }
}
