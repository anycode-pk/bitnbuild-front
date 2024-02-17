class Event {
  final int eventId;
  final int moduleId;
  final String date;
  final String title;
  final String imageUrl;
  final String description;

  Event({
    required this.eventId,
    required this.moduleId,
    required this.date,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['id'] as int,
      moduleId: json['module_id'] as int,
      date: json['date'] as String,
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
      description: json['description'] as String,
    );
  }
}

class EventPlaceholder {
  static List<Event> list = [
    Event(
        eventId: 0,
        moduleId: 0,
        date: "01-01-2001",
        title: "title",
        imageUrl: "https://picsum.photos/seed/picsum/200",
        description: "description"),
    Event(
        eventId: 1,
        moduleId: 0,
        date: "01-01-2011",
        title: "title",
        imageUrl: "https://picsum.photos/seed/picsum/200",
        description: "description"),
    Event(
        eventId: 2,
        moduleId: 0,
        date: "01-01-2002",
        title: "title",
        imageUrl: "https://picsum.photos/seed/picsum/200",
        description: "description"),
    Event(
        eventId: 3,
        moduleId: 0,
        date: "01-01-2005",
        title: "title",
        imageUrl: "https://picsum.photos/seed/picsum/200",
        description: "description"),
    Event(
        eventId: 4,
        moduleId: 0,
        date: "01-01-2006",
        title: "title",
        imageUrl: "https://picsum.photos/seed/picsum/200",
        description: "description"),
  ];
}
