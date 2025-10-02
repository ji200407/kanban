// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:kanban/enums/kanban_status.dart';

class KanbanItem extends StatelessWidget {
  final KanbanStatus status;
  final String title;
  final VoidCallback onChackBox;
  final VoidCallback onDelete;
  final VoidCallback? onStatus;
  
  const KanbanItem({
    Key? key,
    required this.status,
    required this.title,
    required this.onChackBox,
    required this.onDelete,
    this.onStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      title: Row(
        children: [
          //체크박스
          Checkbox(
            visualDensity: VisualDensity.compact,
            onChanged:(_)=>onChackBox(),
            value: status==KanbanStatus.done,
          ),
          //타이틀
          Expanded(
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          //x버튼
          IconButton(
            onPressed: onDelete,
            padding: EdgeInsets.zero,
            iconSize: 24,
            icon: Icon(LucideIcons.x),
          ),
        ],
      ),
      footer: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            decoration: BoxDecoration(color: Colors.green,
            borderRadius: .circular(4),),
            child: Text('Low', style: TextStyle(fontSize: 15)),
          ),

          if(status!=KanbanStatus.done)
          IconButton(
            onPressed:onStatus,
            visualDensity: VisualDensity.compact, 
            iconSize: 30,
            icon: Icon(status.nextIcon))
        ],
      ),
    );
  }
}
