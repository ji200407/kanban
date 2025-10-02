import 'package:flutter/material.dart';
import 'package:kanban/enums/kanban_status.dart';
import 'package:kanban/providers/kanban_provider.dart';
import 'package:kanban/ui/common/themes/app_size.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StatusIsland extends StatelessWidget {
  final KanbanStatus status;
  const StatusIsland({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.StatusIslandHeight,
      child: Row(
        spacing: 7,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: status.bubbleColor,
                borderRadius: BorderRadius.circular(
                  AppSize.StatusIslandHeight + 10,
                ),
              ),
              child: Row(
                spacing: 10,
                children: [
                  Icon(status.icon, size: 24), //
                  Expanded(
                    child: Text(
                      status.label,
                      style: TextStyle(
                        fontSize: 20, //
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildCircleBubble(
            child: Text(
              '2',
              style: TextStyle(
                fontWeight: FontWeight.w600, //
                fontSize: 16,
              ),
            ),
          ),
          _buildCircleBubble(
            onTap: () {
              context.read<KanbanProvider>().addItem(status, 'NewTask');
              debugPrint('$status 추가하기');
            },
            visible: status != KanbanStatus.done,
            child: Icon(
              LucideIcons.plus, //
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleBubble({
    required Widget child, //
    bool visible = true,
    VoidCallback? onTap,
  }) {
    if (!visible) {
      return SizedBox.fromSize(
        size: Size.fromWidth(AppSize.StatusIslandHeight),
      );
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppSize.StatusIslandHeight,
        height: AppSize.StatusIslandHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: status.bubbleColor, //
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
