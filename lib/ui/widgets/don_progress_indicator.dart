import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kanban/providers/kanban_provider.dart';
import 'package:provider/provider.dart';

class DonProgressIndicator extends StatelessWidget {
  const DonProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KanbanProvider>(
      builder: (_, Provider, child) {
        final todoCount = 3;
        final doneCount = 0;

        return Row(
          mainAxisSize: .min,
          children: [
            SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                value: doneCount / todoCount,
                color: Colors.green,
                backgroundColor: Colors.grey,
                strokeWidth: 6,
              ),
            ),SizedBox(height: 10,width: 5,),
          
            Text('$doneCount/$todoCount 완료', style: TextStyle(fontSize: 18)),
          ],
        );
        // return Text(Provider.value.toString(), style: TextStyle(fontSize: 22));
      },
    );
  }
}
