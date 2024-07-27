import 'package:check_mate/services/auth_service.dart';
import 'package:check_mate/typedefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants.dart';
import '../helper/get_label_color.dart';
import '../models/task_model.dart';

class TaskService {
  var taskCollection = FirebaseFirestore.instance.collection(kTaskCollection);
  Future<void> addTask(Task task) async {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      await taskCollection.add({
        'userId': userId,
        'title': task.title,
        'isChecked': false,
        'isPinned': false,
        'label': task.label,
        'color': getLabelColor(task.label),
      });
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await taskCollection.doc(taskId).delete();
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  Future<void> editTask(String taskId, Map<String, dynamic> fields) async {
    try {
      await taskCollection.doc(taskId).update(fields);
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  TaskStream readTasks([bool isPinned = false]) {
    final userId = AuthService().getCurrentUserId();
    var query = taskCollection.where('userId', isEqualTo: userId);
    if (isPinned) {
      query = query.where('isPinned', isEqualTo: true);
    }
    return query.snapshots();
  }

  Future<void> toggleCheck(String taskId, bool isChecked) async {
    try {
      await taskCollection.doc(taskId).update({'isChecked': !isChecked});
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  Future<String> togglePin(String taskId, bool isPinned) async {
    var message =
        isPinned ? 'Task unpinned successfully' : 'Task pinned successfully';
    try {
      await taskCollection.doc(taskId).update({'isPinned': !isPinned});
      return message;
    } catch (e) {
      throw FormatException(e.toString());
    }
  }
}
