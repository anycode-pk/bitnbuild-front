import 'package:flutter/material.dart';

import 'timeline_tile_widget.dart';
import '../event.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline'),
      ),
      body: ListView.builder(
        itemCount: EventPlaceholder.list.length,
        itemBuilder: (context, index) {
          return TimelineTileWidget(
            isFirst: index == 0,
            isLast: index == EventPlaceholder.list.length - 1,
            event: EventPlaceholder.list[index],
          );
        },
      ),
    );
  }
}
