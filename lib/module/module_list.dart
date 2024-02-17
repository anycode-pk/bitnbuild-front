import 'package:flutter/material.dart';
import 'module_card.dart';
import '../timeline/timeline_view.dart'; // Import the TimelineView

class ModuleList extends StatelessWidget {
  const ModuleList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, // Example item count
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
            title: "Module $index",
            description: "Description of Module $index",
            imageUrl: "https://picsum.photos/seed/$index/200",
          ),
        );
      },
    );
  }
}
