// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kanban/enums/kanban_status.dart';

class KanbanItem {
  final String id;
  final KanbanStatus static;
  final String title;
  KanbanItem({required this.id, required this.static, required this.title});

  KanbanItem copyWith({String? id, KanbanStatus? static, String? title}) {
    return KanbanItem(
      id: id ?? this.id,
      static: static ?? this.static,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'static': static.toMap(),
      'title': title,
    };
  }

  factory KanbanItem.fromMap(Map<String, dynamic> map) {
    return KanbanItem(
      id: map['id'] as String,
      static: KanbanStatus.fromMap(map['static'] as Map<String, dynamic>),
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory KanbanItem.fromJson(String source) =>
      KanbanItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'KanbanItem(id: $id, static: $static, title: $title)';

  @override
  bool operator ==(covariant KanbanItem other) {
    if (identical(this, other)) return true;

    return other.id == id && other.static == static && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ static.hashCode ^ title.hashCode;
}
