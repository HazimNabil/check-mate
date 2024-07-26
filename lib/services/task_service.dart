import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants.dart';

class TaskService {
  var taskCollection = FirebaseFirestore.instance.collection(kTaskCollection);
}
