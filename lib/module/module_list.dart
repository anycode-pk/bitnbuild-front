import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'module.dart';
import 'module_card.dart';

class ModuleList extends StatefulWidget {
  const ModuleList({super.key});

  @override
  _ModuleListState createState() => _ModuleListState();
}

class _ModuleListState extends State<ModuleList> {
  List<Module> modules = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchModules();
  }

  void fetchModules() async {
    setState(() {
      isLoading = true;
    });

    var response = await http
        .get(Uri.parse('https://shirotsuma.pythonanywhere.com/modules'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Module> fetchedModules = [];
      for (var moduleData in data) {
        Module module = Module.fromJson(moduleData);
        fetchedModules.add(module);
      }

      setState(() {
        modules = fetchedModules;
        isLoading = false;
      });
    } else {
      setState(() {
        modules = ModulePlaceholder.list;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: modules.length,
            itemBuilder: (context, index) {
              return ModuleCard(module: modules[index]);
            },
          );
  }
}
