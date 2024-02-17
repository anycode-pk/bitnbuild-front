import 'package:flutter/material.dart';
import 'module_card.dart';
import '../timeline/timeline_view.dart'; // Import the TimelineView
import '../module.dart';

class ModuleList extends StatelessWidget {
  const ModuleList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ModulePlaceholder.list.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const TimelineView()), // Navigate to TimelineView
            );
          },
          child: ModuleCard(
            title: ModulePlaceholder.list[index].title,
            description: ModulePlaceholder.list[index].description,
            imageUrl: ModulePlaceholder.list[index].imageUrl,
          ),
        );
      },
    );
  }
}
