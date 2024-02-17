import 'package:flutter/material.dart';
import 'module_card.dart';
import '../module.dart';

class ModuleList extends StatelessWidget {
  const ModuleList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ModulePlaceholder.list.length,
      itemBuilder: (context, index) {
        return ModuleCard(module: ModulePlaceholder.list[index]);
      },
    );
  }
}
