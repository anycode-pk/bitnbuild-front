import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline'),
      ),
      body: ListView.builder(
        itemCount: 5, // Example item count
        itemBuilder: (context, index) {
          // Dummy data for dates and titles
          List<String> dates = [
            '2022-01-01',
            '2022-02-01',
            '2022-03-01',
            '2022-04-01',
            '2022-05-01'
          ];
          List<String> titles = [
            'Event 1',
            'Event 2',
            'Event 3',
            'Event 4',
            'Event 5'
          ];
          return TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.3,
            isFirst: index == 0,
            isLast: index == 4,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Colors.blue,
              padding: EdgeInsets.all(6),
            ),
            startChild: Container(
              constraints: const BoxConstraints(minWidth: 120),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(dates[index]),
            ),
            endChild: Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListTile(
                title: Text(titles[index]),
                subtitle: const Text('Event details...'),
              ),
            ),
          );
        },
      ),
    );
  }
}
