import 'package:flutter/material.dart';
import 'package:kanban/presentation/screens/kanban/models/kanban_model.dart';
import 'package:kanban/presentation/screens/kanban/models/user_model.dart';

Map<String, dynamic> kanbanData = {
  'Pending': {
    'color': const Color.fromRGBO(239, 147, 148, 1),
    'items': [
      KanbanModel(
          id: 1,
          totalSeconds: 0,
          label: 'Task 1', timeSpent: '00:00:00',
          user: users[0], activeTime: '',
          status: 'pending', sessions: []),
      KanbanModel(
          id: 2,
          totalSeconds: 0,
          label: 'Task 2', timeSpent: '00:00:00',
          user: users[2], activeTime: '',
          status: 'pending', sessions: []),
      KanbanModel(
          id: 3,
          totalSeconds: 0,
          label: 'Task 3', timeSpent: '00:00:00',
          user: users[2], activeTime: '',
          status: 'pending', sessions: []),
    ]
  },
  'In progress': {
    'color': const Color.fromRGBO(255, 230, 168, 1),
    'items': [
      KanbanModel(
          id: 4,
          totalSeconds: 0,
          label: 'Task 4', timeSpent: '00:00:00',
          user: users[1], activeTime: '',
          status: 'in progress', sessions: []),
      KanbanModel(
          id: 5,
          totalSeconds: 0,
          label: 'Task 5', timeSpent: '00:00:00',
          user: users[2], activeTime: '',
          status: 'in progress', sessions: []),
      KanbanModel(
          id: 6,
          totalSeconds: 0,
          label: 'Task 6', timeSpent: '00:00:00',
          user: users[0], activeTime: '',
          status: 'in progress', sessions: []),
      KanbanModel(
          id: 7,
          totalSeconds: 0,
          label: 'Task 7', timeSpent: '00:00:00',
          user: users[2], activeTime: '',
          status: 'in progress', sessions: []),
      KanbanModel(
          id: 8,
          totalSeconds: 0,
          label: 'Task 8', timeSpent: '00:00:00',
          user: users[3], activeTime: '',
          status: 'in progress', sessions: []),
    ]
  },
  'Blocked': {
    'color': const Color.fromRGBO(148, 235, 168, 1),
    'items': [
      KanbanModel(
          id: 9,
          totalSeconds: 0,
          label: 'Task 9', timeSpent: '00:00:00',
          user: users[0], activeTime: '',
          status: 'blocked', sessions: []),
      KanbanModel(
          id: 10,
          totalSeconds: 0,
          label: 'Task 10', timeSpent: '00:00:00',
          user: users[1], activeTime: '',
          status: 'blocked', sessions: []),
      KanbanModel(
          id: 11,
          totalSeconds: 0,
          label: 'Task 11', timeSpent: '00:00:00',
          user: users[3], activeTime: '',
          status: 'blocked', sessions: []),
      KanbanModel(
          id: 12,
          totalSeconds: 0,
          label: 'Task 12', timeSpent: '00:00:00',
          user: users[2], activeTime: '',
          status: 'blocked', sessions: []),
    ]
  },
  'Completed': {
    'color': const Color.fromRGBO(148, 235, 168, 1),
    'items': [
      KanbanModel(
          id: 12,
          totalSeconds: 0,
          label: 'Task 12', timeSpent: '00:00:00',
          user: users[3], activeTime: '',
          status: 'completed', sessions: []),
    ]
  },
};