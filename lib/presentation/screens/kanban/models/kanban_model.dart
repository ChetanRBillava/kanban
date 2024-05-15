import 'dart:convert';

import 'package:kanban_board/presentation/screens/kanban/models/user_model.dart';

class KanbanModel {
  int id;
  int totalSeconds;
  String label;
  String timeSpent;
  UserModel user;
  String activeTime;
  String status;
  List<Session> sessions;

  KanbanModel({
    required this.id,
    required this.totalSeconds,
    required this.label,
    required this.timeSpent,
    required this.user,
    required this.activeTime,
    required this.status,
    required this.sessions,
  });

  factory KanbanModel.fromJson(String str) => KanbanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KanbanModel.fromMap(Map<String, dynamic> json) => KanbanModel(
    id: json['id'],
    totalSeconds: json['totalSeconds'],
    label: json['label'],
    timeSpent: json['timeSpent'],
    user: json['user'],
    activeTime: json['activeTime'],
    status: json['status'],
    sessions: List<Session>.from(json['sessions'].map((x) => Session.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'totalSeconds': totalSeconds,
    'label': label,
    'timeSpent': timeSpent,
    'user': user,
    'activeTime': activeTime,
    'status': status,
    'sessions': List<dynamic>.from(sessions.map((x) => x.toMap())),
  };
}

class Session {
  String startTime;
  String endTime;

  Session({
    required this.startTime,
    required this.endTime,
  });

  factory Session.fromJson(String str) => Session.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Session.fromMap(Map<String, dynamic> json) => Session(
    startTime: json['startTime'],
    endTime: json['endTime'],
  );

  Map<String, dynamic> toMap() => {
    'startTime': startTime,
    'endTime': endTime,
  };
}
