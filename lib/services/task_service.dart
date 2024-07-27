import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../helper/get_label_color.dart';
import '../helper/show_snack_bar.dart';
import '../models/task_model.dart';

class TaskService {
  var taskCollection = FirebaseFirestore.instance.collection(kTaskCollection);

  Future<void> addTask(Task task, BuildContext context) async {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      await taskCollection.add({
        'id': userId,
        'title': task.title,
        'isChecked': false,
        'isPinned': false,
        'label': task.label,
        'color': getLabelColor(task.label),
      });
    } catch (e) {
      if (context.mounted) showSnackBar(context, e.toString());
    }
  }

  Future<void> deleteTask(String taskId, BuildContext context) async {
    try {
      await taskCollection.doc(taskId).delete();
    } catch (e) {
      if (context.mounted) showSnackBar(context, e.toString());
    }
  }

  Future<void> editTask(
    String taskId,
    Map<String, dynamic> fields,
    BuildContext context,
  ) async {
    try {
      await taskCollection.doc(taskId).update(fields);
    } catch (e) {
      if (context.mounted) showSnackBar(context, e.toString());
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readTasks([
    bool isPinned = false,
  ]) {
    return isPinned
        ? taskCollection.where('isPinned', isEqualTo: isPinned).snapshots()
        : taskCollection.snapshots();
  }
}
