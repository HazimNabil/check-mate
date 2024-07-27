import 'package:check_mate/constants.dart';
import 'package:check_mate/helper/show_dialog.dart';
import 'package:check_mate/helper/show_snack_bar.dart';
import 'package:check_mate/services/task_service.dart';
import 'package:check_mate/widgets/label_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/task_model.dart';
import 'edit_task_dialog.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  final String taskId;

  const TaskTile({super.key, required this.task, required this.taskId});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  var taskCollection = FirebaseFirestore.instance.collection(kTaskCollection);

  Future<void> delete(BuildContext context) async {
    await TaskService().deleteTask(widget.taskId, context);
  }

  Future<void> toggleCheck() async {
    TaskService().toggleCheck(widget.taskId, widget.task.isChecked, context);
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

  (IconData, void Function(BuildContext)) getTaskPinState() {
    IconData icon;
    void Function(BuildContext) pinMethod;
    if (widget.task.isPinned) {
      icon = Icons.push_pin_outlined;
      pinMethod = unpinTask;
    } else {
      icon = Icons.push_pin;
      pinMethod = pinTask;
    }
    return (icon, pinMethod);
  }

  void showEditDialog(context) {
    showTaskDialog(
      context,
      EditTaskDialog(
        oldTitle: widget.task.title,
        oldLabel: widget.task.label,
        taskId: widget.taskId,
      ),
    );
  }

  void pinTask(pinContext) async {
    try {
      await taskCollection.doc(widget.taskId).update({'isPinned': true});
      if (mounted) {
        showSnackBar(context, 'Task pinned successfully');
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }

  void unpinTask(pinContext) async {
    try {
      await taskCollection.doc(widget.taskId).update({'isPinned': false});
      if (mounted) {
        showSnackBar(context, 'Task unpinned successfully');
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var (checkIcon, decoration) = getTaskCheckState();
    var (pinIcon, pinMethod) = getTaskPinState();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Slidable(
        key: ValueKey(widget.taskId),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: pinMethod,
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
              onPressed: delete,
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
