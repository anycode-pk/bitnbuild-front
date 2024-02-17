import 'package:flutter/material.dart';
import '../event.dart';

class TimelineEvent extends StatelessWidget {
  final Event event;

  const TimelineEvent({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // Fixed width for the card
      child: Card(
        child: ListTile(
          title: Text(event.title),
          subtitle: const Text('Event details...'),
        ),
      ),
    );
  }
}
