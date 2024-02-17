import 'package:flutter/material.dart';
import '../event/event.dart';
import 'timeline_tile_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TimelineList extends StatefulWidget {
  final int moduleId;
  const TimelineList({super.key, required this.moduleId});

  @override
  _TimelineListState createState() => _TimelineListState();
}

class _TimelineListState extends State<TimelineList> {
  List<Event> events = [];
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

    var response = await http.get(Uri.parse(
        'https://shirotsuma.pythonanywhere.com/timeline/${widget.moduleId}'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Event> fetchedModules = [];
      for (var moduleData in data) {
        Event module = Event.fromJson(moduleData);
        fetchedModules.add(module);
      }

      setState(() {
        events = fetchedModules;
        isLoading = false;
      });
    } else {
      setState(() {
        events = EventPlaceholder.list;
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
            itemCount: events.length,
            itemBuilder: (context, index) {
              return TimelineTileWidget(
                  event: events[index],
                  isFirst: 0 == index,
                  isLast: index == events.length - 1);
            },
          );
  }
}
