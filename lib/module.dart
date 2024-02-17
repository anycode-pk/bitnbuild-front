class Module {
  final int moduleId;
  final String title;
  final String imageUrl;
  final String description;

  Module({
    required this.moduleId,
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}

class ModulePlaceholder {
  static List<Module> list = [
    Module(
        moduleId: 0,
        title: "Module0",
        imageUrl: "https://picsum.photos/seed/13/200",
        description: "description"),
    Module(
        moduleId: 1,
        title: "Module1",
        imageUrl: "https://picsum.photos/seed/1/200",
        description: "description"),
    Module(
        moduleId: 2,
        title: "Module2",
        imageUrl: "https://picsum.photos/seed/2/200",
        description: "description"),
    Module(
        moduleId: 3,
        title: "Module3",
        imageUrl: "https://picsum.photos/seed/3/200",
        description: "description"),
  ];
}
