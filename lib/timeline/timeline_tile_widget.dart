import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../event/event.dart';
import 'timeline_event.dart';

class TimelineTileWidget extends StatelessWidget {
  final Event event;
  final bool isFirst;
  final bool isLast;

  const TimelineTileWidget({
    super.key,
    required this.event,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color primaryColor = theme.primaryColor;

    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      alignment: TimelineAlign.manual,
      lineXY: 0.3,
      indicatorStyle: IndicatorStyle(
        width: 20,
        color: primaryColor,
        padding: const EdgeInsets.all(6),
      ),
      beforeLineStyle: LineStyle(
        color: primaryColor,
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
