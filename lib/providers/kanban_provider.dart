import 'package:flutter/widgets.dart';
import 'package:kanban/enums/kanban_status.dart';
import 'package:kanban/ui/kanban/kanban_board.dart';

class KanbanProvider with ChangeNotifier {
  KanbanStatus kanbanStatus=.todo;
  //private fun refeshUI()
  void _refreshUI() => notifyListeners();

  void setKanbanStatus(KanbanStatus status){
    if(kanbanStatus==status)return;
    kanbanStatus=status;
    _refreshUI();
  }

}
