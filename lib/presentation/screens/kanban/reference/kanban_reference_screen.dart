import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/logic/cubit/app_theme_cubit.dart';
import 'package:kanban/presentation/screens/kanban/models/kanban_model.dart';
import 'package:kanban/presentation/screens/kanban/models/user_model.dart';
import 'package:kanban/presentation/screens/kanban/reference/list_footer.dart';
import 'package:kanban/presentation/screens/kanban/reference/list_header.dart';
import 'package:kanban/presentation/screens/kanban/widgets/kanban_tile.dart';
import 'package:kanban/presentation/utils/app_texts.dart';
import 'package:kanban/presentation/utils/custom_print.dart';
import 'package:kanban_board/kanban_board.dart';

import 'package:kanban/presentation/screens/kanban/reference/kanban_data.dart';

class KanbanReferenceScreen extends StatefulWidget {
  const KanbanReferenceScreen({super.key});

  @override
  State<KanbanReferenceScreen> createState() => _KanbanReferenceScreenState();
}

class _KanbanReferenceScreenState extends State<KanbanReferenceScreen>
    with TickerProviderStateMixin {
  get width => 350.0;
  final _controller = KanbanBoardController();

  List<KanbanBoardGroup<String, KanbanGroupItem>> kanbanGroups = List.generate(
    kanbanData.length,
    (index) => KanbanBoardGroup(
      id: 'group_$index',
      name: 'Group $index',
      items: List.generate(
        math.Random().nextInt(10),
        (itemIndex) => KanbanGroupItem(
          itemId: 'group_item_$itemIndex',
          title: 'Item $itemIndex',
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 244, 240, 1),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: KanbanBoard(
          controller: _controller,
          groups: kanbanGroups,
          groupItemBuilder: groupItemBuilder,
          onGroupItemMove:
              (oldGroupIndex, oldItemIndex, newGroupIndex, newItemIndex) {},
          onGroupMove: (oldGroupIndex, newGroupIndex) {},
        ),
      ),
    );
  }

  Widget groupItemBuilder(context, groupId, itemIndex) {
    final groupItem = kanbanGroups
        .firstWhere((element) => element.id == groupId)
        .items[itemIndex];
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(groupItem.title),
    );
  }
}

class KanbanGroupItem extends KanbanBoardGroupItem {
  final String itemId;
  final String title;

  KanbanGroupItem({
    required this.itemId,
    required this.title,
  });

  @override
  String get id => itemId;
}
