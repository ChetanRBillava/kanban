import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:drag_and_drop_lists/drag_handle.dart';
import 'package:flutter/material.dart';
import 'package:kanban/presentation/screens/kanban/widgets/kanban_tile.dart';

import 'draggable_list.dart';
import 'draggable_list_data.dart';

class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({super.key});

  @override
  State<DragAndDropScreen> createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
  late List<DragAndDropList> lists;

  @override
  void initState() {
    super.initState();

    lists = allLists.map(buildList).toList();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = const Color.fromARGB(255, 243, 242, 248);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Drag and drop'),
        centerTitle: true,
      ),
      body: DragAndDropLists(
        // lastItemTargetHeight: 50,
        // addLastItemTargetHeightToTop: true,
        // lastListTargetSize: 30,
        listWidth:340,
        listPadding: const EdgeInsets.all(16),
        listInnerDecoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        children: lists,
        itemDivider: Divider(thickness: 2, height: 2, color: backgroundColor),
        itemDecorationWhileDragging: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        listDragHandle: buildDragHandle(isList: true),
        //itemDragHandle: buildDragHandle(isList: true),
        onItemReorder: onReorderListItem,
        onListReorder: onReorderList,
        axis: Axis.horizontal,
      ),
    );
  }

  DragHandle buildDragHandle({bool isList = false}) {
    final verticalAlignment = isList
        ? DragHandleVerticalAlignment.top
        : DragHandleVerticalAlignment.center;
    final color = isList ? Colors.blueGrey : Colors.black26;

    return DragHandle(
      verticalAlignment: verticalAlignment,
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Icon(Icons.menu, color: color),
      ),
    );
  }

  DragAndDropList buildList(DraggableList list) => DragAndDropList(
    header: Container(
      padding: EdgeInsets.all(8),
      child: Text(
        list.header,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
    children: list.items
        .map((task) => DragAndDropItem(
      child: KanbanTile(
        task: task,
        index: 0,
        status: list.status,
      ),
    ))
        .toList(),
  );

  void onReorderListItem(
      int oldItemIndex,
      int oldListIndex,
      int newItemIndex,
      int newListIndex,
      ) {
    setState(() {

      final oldListItems = lists[oldListIndex].children;
      final newListItems = lists[newListIndex].children;
      print('Old List: ${allLists[oldListIndex].header}, ${allLists[oldListIndex].status}');
      print('New List: ${allLists[newListIndex].header}, ${allLists[newListIndex].status}');

      final movedItem = oldListItems.removeAt(oldItemIndex);
      newListItems.insert(newItemIndex, movedItem);

      print('New count: ${allLists[oldListIndex].items.length}');
    });
  }

  void onReorderList(
      int oldListIndex,
      int newListIndex,
      ) {
    setState(() {
      final movedList = lists.removeAt(oldListIndex);
      lists.insert(newListIndex, movedList);
    });
  }
}
