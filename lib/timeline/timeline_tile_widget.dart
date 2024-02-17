import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../event/event.dart';
import 'timeline_event.dart';

class TimelineTileWidget extends StatelessWidget {
  final Event event;
  final bool isFirst;
  final bool isLast;

  const TimelineTileWidget(
      {super.key,
      required this.event,
      required this.isFirst,
      required this.isLast});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      alignment: TimelineAlign.center,
      indicatorStyle: const IndicatorStyle(
        width: 20,
        color: Colors.blue,
        padding: EdgeInsets.all(6),
      ),
      beforeLineStyle: const LineStyle(
        color: Colors.blue,
        thickness: 2,
      ),
      startChild: Align(
        alignment: Alignment.centerRight,
        child: Text(
          event.date,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      endChild: Align(
        alignment: Alignment.centerLeft,
        child: TimelineEvent(
          event: event,
        ),
      ),
    );
  }
}
