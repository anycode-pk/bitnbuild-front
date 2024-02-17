import 'package:flutter/material.dart';
import 'module_list.dart';

class ModuleView extends StatelessWidget {
  const ModuleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modules"),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: const ModuleList(),
        ),
      ),
    );
  }
}
