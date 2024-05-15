import 'dart:convert';

import 'package:kanban/presentation/screens/kanban/models/kanban_model.dart';

class KanbanStructure {
  String title;
  String status;
  List<KanbanModel> tasks;

  KanbanStructure({
    required this.title,
    required this.status,
    required this.tasks,
  });

  factory KanbanStructure.fromJson(String str) => KanbanStructure.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KanbanStructure.fromMap(Map<String, dynamic> json) => KanbanStructure(
    title: json['title'],
    status: json['status'],
    tasks: List<KanbanModel>.from(json['tasks'].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    'title': title,
    'status': status,
    'tasks': List<dynamic>.from(tasks.map((x) => x)),
  };
}
