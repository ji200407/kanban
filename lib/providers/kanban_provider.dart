import 'package:flutter/widgets.dart';
import 'package:kanban/enums/kanban_status.dart';
import 'package:kanban/ui/kanban/kanban_board.dart';

class KanbanProvider with ChangeNotifier {
  KanbanStatus kanbanStatus=.todo;
  List<(KanbanStatus status,String title)> items=[];
  //private fun refeshUI()
  //ui새로고침
  void _refreshUI() => notifyListeners();

  void setKanbanStatus(KanbanStatus status){
    if(kanbanStatus==status)return;
    kanbanStatus=status;
    _refreshUI();
  }
  //아이템 추가
  void addItem(KanbanStatus status,String value){
    items.add((status,value));
    notifyListeners();
  }
  //아이템 삭제
  void deleteItemIndex(int index){
    items.removeAt(index);
    notifyListeners();
    }
}
