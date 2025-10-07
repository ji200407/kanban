import 'package:flutter/widgets.dart';
import 'package:kanban/enums/kanban_status.dart';
import 'package:kanban/models/kanban_item.dart';
import 'package:kanban/ui/kanban/kanban_board.dart';
import 'package:uuid/uuid.dart';

class KanbanProvider with ChangeNotifier {
  KanbanStatus kanbanStatus=.todo;
  List<KanbanItem> items=[];
  //private fun refeshUI()
  //ui새로고침
  void _refreshUI() => notifyListeners();

  void setKanbanStatus(KanbanStatus status){
    if(kanbanStatus==status)return;
    kanbanStatus=status;
    _refreshUI();
  }
  //아이템 추가
  void addItem(KanbanStatus status,String title){
    items.add(KanbanItem(id:Uuid().v4() , status: status, title: title));
    notifyListeners();
  }
  //아이템 삭제
  void deleteItem(String id){
    items.removeWhere((e)=>e.id==id);
    notifyListeners();
    }

//     void fetchData(){
//       //데이터 클래스화 formMap 
//       //final responseBody=http.get();
//       //responseBody==>JSON 형식 데이터(map형식)
//       //kanbabitem=kanbanItem.formMap(responseBody)
//     }
}
