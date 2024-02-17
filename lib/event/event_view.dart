import 'package:flutter/material.dart';
import 'event.dart'; // Import the Event class

class EventView extends StatelessWidget {
  final Event event;

  const EventView({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${event.title}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Date: ${event.date}'),
            SizedBox(height: 8),
            Text('Description: ${event.description}'),
            SizedBox(height: 8),
            // You can display other event information here
          ],
        ),
      ),
    );
  }
}
