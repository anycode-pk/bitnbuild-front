import 'package:flutter/material.dart';
import '../event.dart';
import 'timeline_tile_widget.dart';

class TimelineList extends StatelessWidget {
  const TimelineList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: EventPlaceholder.list.length,
      itemBuilder: (context, index) {
        return TimelineTileWidget(
          isFirst: index == 0,
          isLast: index == EventPlaceholder.list.length - 1,
          event: EventPlaceholder.list[index],
        );
      },
    );
  }
}
