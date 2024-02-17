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
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 200, // Adjust the height as needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(module.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                module.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24, // Adjust the font size as needed
                  color: Colors.white,
                ),
                maxLines: 2, // Limit to 2 lines to ensure it fits
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                module.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
