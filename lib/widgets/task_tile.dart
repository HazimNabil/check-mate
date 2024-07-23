import 'package:check_mate/constants.dart';
import 'package:check_mate/helper/show_snack_bar.dart';
import 'package:check_mate/widgets/label_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/task_model.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  final String taskId;

  const TaskTile({super.key, required this.task, required this.taskId});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  var taskCollection = FirebaseFirestore.instance.collection(kTaskCollection);

  void deleteTask(context) async {
    try {
      await taskCollection.doc(widget.taskId).delete();
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              icon: FontAwesomeIcons.mapPin,
              backgroundColor: kPrimaryColor,
              foregroundColor: kBackgroundColor,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              icon: Icons.edit,
              backgroundColor: Colors.blue,
              foregroundColor: kBackgroundColor,
            ),
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              foregroundColor: kBackgroundColor,
            ),
          ],
        ),
        child: ListTile(
          tileColor: Color(widget.task.color),
          contentPadding: const EdgeInsets.symmetric(horizontal: 2),
          horizontalTitleGap: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.check_box_outline_blank,
              size: 21,
            ),
            onPressed: () {},
          ),
          title: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              widget.task.title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          trailing: LabelItem(
            label: widget.task.label,
            color: kPrimaryColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
