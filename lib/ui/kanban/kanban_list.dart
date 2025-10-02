import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanban/enums/kanban_status.dart';
import 'package:kanban/providers/kanban_provider.dart';
import 'package:kanban/ui/common/status_island.dart';
import 'package:kanban/ui/kanban/widgets/kanban_item.dart';
import 'package:provider/provider.dart';

class KanbanList extends StatelessWidget {
  final KanbanStatus status;
  const KanbanList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: status.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 10,
        children: [StatusIsland(status: status),
        Expanded(
          child: Consumer<KanbanProvider>(
            builder: (context,provider,_){
              final items=provider.items;
              final searchedItems=items.where((e)=>e.$1==status).toList();

              return ListView.separated(
              itemCount:searchedItems.length,
              shrinkWrap:true,
              separatorBuilder:(context, index) => SizedBox(height: 20),
              itemBuilder: (context,index){
                return KanbanItem(
                  status: status,
                  title: 'newTask${index+1}',
                  onChackBox: (){
                    debugPrint(
                    '$status->체크박스 클릭함'
                    );
                  },
                  onDelete: (){
                    debugPrint(
                      '$status->삭제'
                    );
                    context.read<KanbanProvider>().deleteItemIndex(index);
                  },
                  onStatus: (){},
                );
              },
              );}
          ),
        ),
          ],
      ),
    );
  }
}