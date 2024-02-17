import 'package:flutter/material.dart';
import 'module.dart';
import '../timeline/timeline_view.dart';

class ModuleCard extends StatelessWidget {
  final Module module;

  const ModuleCard({
    super.key,
    required this.module,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TimelineView(
                        moduleId: module.moduleId,
                      )));
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  module.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 16 / 9, // Change the aspect ratio as needed
                child: Image.network(
                  module.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(module.description),
              ),
            ],
          ),
        ));
  }
}
