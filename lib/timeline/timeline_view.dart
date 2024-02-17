import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({Key? key}) : super(key: key);

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
              alignment: TimelineAlign.center,
              isFirst: index == 0,
              isLast: index == 4,
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
                  dates[index],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              endChild: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 200, // Fixed width for the card
                  child: Card(
                    child: ListTile(
                      title: Text(titles[index]),
                      subtitle: const Text('Event details...'),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
