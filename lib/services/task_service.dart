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
        'id': userId,
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

  Stream<QuerySnapshot<Map<String, dynamic>>> readTasks() {
    return taskCollection.snapshots();
  }
}
