import 'package:flutter/material.dart';
import 'package:kanban/providers/kanban_provider.dart';
import 'package:kanban/ui/kanban/kanban_board.dart';
import 'package:kanban/ui/widgets/top_container.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class KanbanScreen extends StatelessWidget {
  const KanbanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final provider = context.read<KanbanProvider>();
        },
        child: Icon(LucideIcons.plus),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            spacing: 25,
            crossAxisAlignment: .stretch, //밑에 여백
            children: [
              //Top container
              TopContainer(),
              Expanded(child: KanbanBoard()),
            ],
          ),
        ),
      ),
    );
  }
}
