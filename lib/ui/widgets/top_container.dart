import 'package:flutter/material.dart';
import 'package:kanban/ui/widgets/don_progress_indicator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadAlert(
      crossAxisAlignment: CrossAxisAlignment.center,
      icon: Icon(LucideIcons.smile, size: 28),
      title: Row(
        children: [
          Expanded(child: Text('Kanban board', style: TextStyle(fontSize: 25))),
          DonProgressIndicator(),
        ],
      ),
    );
  }
}
