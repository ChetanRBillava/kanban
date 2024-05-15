import 'dart:io';

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
import 'package:kanban_board/custom/board.dart';
import 'package:kanban_board/models/inputs.dart';

import 'package:kanban/presentation/screens/kanban/reference/kanban_data.dart';

class KanbanReferenceScreen extends StatefulWidget {
  const KanbanReferenceScreen({super.key});

  @override
  State<KanbanReferenceScreen> createState() => _KanbanReferenceScreenState();
}

class _KanbanReferenceScreenState extends State<KanbanReferenceScreen> {
  get width => 350.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 244, 240, 1),
      appBar: AppBar(title: const Text('Home'),),
      body: SafeArea(
        child: KanbanBoard(
          List.generate(kanbanData.length, (index) {
            final element = kanbanData.values.elementAt(index);
            customPrint.myCustomPrint('Title: ${kanbanData.keys.elementAt(index)}');
            return BoardListsData(
                backgroundColor: const Color.fromRGBO(249, 244, 240, 1),
                width: 350.0,
                footer: const ListFooter(),
                headerBackgroundColor:
                const Color.fromRGBO(249, 244, 240, 1),
                header: ListHeader(
                  title: kanbanData.keys.elementAt(index),
                  stateColor: element['color'],
                ),
                items: List.generate(element['items'].length, (index) {

                  return KanbanTile(
                    task: element['items'][index],
                    taskIndex: index, structureIndex: -1,);
                }));
          }),
          onItemLongPress: (cardIndex, listIndex) {},
          onItemReorder:
              (oldCardIndex, newCardIndex, oldListIndex, newListIndex) {},
          onListLongPress: (listIndex) {},
          onListReorder: (oldListIndex, newListIndex) {},
          onItemTap: (cardIndex, listIndex) {},
          onListTap: (listIndex) {},
          onListRename: (oldName, newName) {},
          backgroundColor: const Color.fromRGBO(249, 244, 240, 1),
          displacementY: 124,
          displacementX: 100,
          textStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
