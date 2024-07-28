import 'package:check_mate/constants.dart';
import 'package:check_mate/helper/show_dialog.dart';
import 'package:check_mate/helper/show_snack_bar.dart';
import 'package:check_mate/services/task_service.dart';
import 'package:check_mate/widgets/label_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/task_model.dart';
import 'delete_task_dialog.dart';
import 'edit_task_dialog.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  final String taskId;

  const TaskTile({super.key, required this.task, required this.taskId});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  Future<void> toggleCheck() async {
    try {
      await TaskService().toggleCheck(
        widget.taskId,
        widget.task.isChecked,
      );
    } on FormatException catch (e) {
      if (mounted) showSnackBar(context, e.message);
    }
  }

  Future<void> togglePin(BuildContext pinContext) async {
    try {
      var message = await TaskService().togglePin(
        widget.taskId,
        widget.task.isPinned,
      );
      if (mounted) showSnackBar(context, message);
    } on FormatException catch (e) {
      if (mounted) showSnackBar(context, e.message);
    }
  }

  (IconData, TextDecoration?) getTaskCheckState() {
    IconData icon;
    TextDecoration? decoration;
    if (widget.task.isChecked) {
      icon = Icons.check_box;
      decoration = TextDecoration.lineThrough;
    } else {
      icon = Icons.check_box_outline_blank;
      decoration = null;
    }
    return (icon, decoration);
  }

  IconData getTaskPinState() {
    return widget.task.isPinned ? Icons.push_pin_outlined : Icons.push_pin;
  }

  void showEditDialog(BuildContext context) {
    showTaskDialog(
      context,
      EditTaskDialog(
        oldTitle: widget.task.title,
        oldLabel: widget.task.label,
        taskId: widget.taskId,
      ),
    );
  }

  void showDeleteDialog(BuildContext context) {
    showTaskDialog(
      context,
      DeleteTaskDialog(
        taskId: widget.taskId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var (checkIcon, decoration) = getTaskCheckState();
    var pinIcon = getTaskPinState();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Slidable(
        key: ValueKey(widget.taskId),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: togglePin,
              icon: pinIcon,
              backgroundColor: kPrimaryColor,
              foregroundColor: kBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: showEditDialog,
              icon: Icons.edit,
              backgroundColor: kPrimaryColor,
              foregroundColor: kBackgroundColor,
            ),
            SlidableAction(
              onPressed: showDeleteDialog,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              foregroundColor: kBackgroundColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
          ],
        ),
        child: ListTile(
          tileColor: Color(widget.task.color),
          contentPadding: const EdgeInsets.symmetric(horizontal: 2),
          horizontalTitleGap: 0,
          leading: IconButton(
            icon: Icon(
              checkIcon,
              size: 21,
              color: kPrimaryColor,
            ),
            onPressed: toggleCheck,
          ),
          title: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              widget.task.title,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                decoration: decoration,
                decorationThickness: 2,
                decorationColor: kPrimaryColor,
              ),
            ),
          ),
          trailing: LabelItem(
            label: widget.task.label,
            color: kPrimaryColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
