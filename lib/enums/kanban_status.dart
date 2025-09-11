enum KanbanStatus { todo, progresss, done }

extension KanbanStatusExtension on KanbanStatus {
  String get label => switch (this) {
    KanbanStatus.todo => 'To-Do',
    KanbanStatus.progresss => 'In progress',
    KanbanStatus.done => 'Done',
  };
}
