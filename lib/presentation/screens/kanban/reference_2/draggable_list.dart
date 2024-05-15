import 'package:kanban/presentation/screens/kanban/models/kanban_model.dart';

class DraggableList {
  final String header;
  final String status;
  final List<KanbanModel> items;

  const DraggableList({
    required this.header,
    required this.status,
    required this.items,
  });
}

class DraggableListItem {
  final String title;
  final String urlImage;

  const DraggableListItem({
    required this.title,
    required this.urlImage,
  });
}
