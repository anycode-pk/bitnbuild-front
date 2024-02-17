import 'package:flutter/material.dart';
import '../event.dart';
import '../event/event_view.dart';

class TimelineEvent extends StatelessWidget {
  final Event event;

  const TimelineEvent({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Event event = EventPlaceholder.list[0];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventView(event: event),
            ),
          );
        },
        child: SizedBox(
          width: 200, // Fixed width for the card
          child: Card(
            child: ListTile(
              title: Text(event.title),
              subtitle: const Text('Event details...'),
            ),
          ),
        ));
  }
}
