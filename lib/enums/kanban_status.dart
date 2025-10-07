import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum KanbanStatus { todo, progress, done }

extension KanbanStatusExtensions on KanbanStatus {
  String get label => switch (this) {
    KanbanStatus.todo => 'To-do',
    KanbanStatus.progress => 'In Progress',
    KanbanStatus.done => 'Done',
  };

  Color get backgroundColor => switch (this) {
    KanbanStatus.todo => Color(0xFFF8F8F8),
    KanbanStatus.progress => Color(0xFFEBF7FC),
    KanbanStatus.done => Color(0xFFEDF9E8),
  };

  Color get bubbleColor => switch (this) {
    KanbanStatus.todo => Color(0xFFE8E8E8),
    KanbanStatus.progress => Color(0xFFC8E9FF),
    KanbanStatus.done => Color(0xFFCAF089),
  };

  IconData get icon => switch (this) {
    KanbanStatus.todo => LucideIcons.circlePause,
    KanbanStatus.progress => LucideIcons.circlePlay,
    KanbanStatus.done => LucideIcons.circleCheck,
  };

  IconData get nextIcon => switch (this) {
    KanbanStatus.todo => LucideIcons.circlePlay,
    KanbanStatus.progress => LucideIcons.circlePause,
    KanbanStatus.done => LucideIcons.circleCheck,
  };
}

class KanbanUtil {
  static KanbanStatus stringToStatus(String value) {
    //1번째 if else 사용
    //   KanbanStatus status;
    //   if (value == KanbanStatus.todo) {
    //     status = KanbanStatus.todo;
    //   } else if (value == 'progress') {
    //     status = KanbanStatus.progress;
    //   } else if(value=='done'){
    //     status = KanbanStatus.done;
    //   }else{
    //     status=KanbanStatus.todo;
    //   }
    //   return status;
    //2번째 Switch-case
    // return switch(value){
    //   'progress'=>KanbanStatus.progress,
    //   'done'=>KanbanStatus.done,
    //   _=>KanbanStatus.todo
    // };
    //3번째 다른데서도 쓸수잇음 코틀린
    return KanbanStatus.values.firstWhere(
      (e) => e.name == value,
      orElse: () => KanbanStatus.todo,
    );
  }
}
