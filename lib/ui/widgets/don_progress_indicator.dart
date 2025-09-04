import 'package:flutter/material.dart';
import 'package:kanban/providers/kanban_provider.dart';
import 'package:provider/provider.dart';

class DonProgressIndicator extends StatelessWidget {
  const DonProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KanbanProvider>(
      builder: (_, Provider, child) {
        return Text(Provider.value.toString(), style: TextStyle(fontSize: 22));
      },
    );
  }
}
