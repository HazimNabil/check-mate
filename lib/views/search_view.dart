import 'package:check_mate/constants.dart';
import 'package:check_mate/widgets/custom_text_field.dart';
import 'package:check_mate/widgets/loading_indicator.dart';
import 'package:check_mate/widgets/something_went_wrong.dart';
import 'package:check_mate/widgets/task_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/cancel_button.dart';

class SearchView extends StatefulWidget {
  static String route = 'search_view';

  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> tasks = [];
  Stream<QuerySnapshot<Map<String, dynamic>>>? stream;
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: CustomTextField(
          hint: 'Search your list',
          onChanged: (value) {
            setState(() {
              searchTerm = value.toLowerCase();
              var taskCollection =
                  FirebaseFirestore.instance.collection(kTaskCollection);
              stream = taskCollection.snapshots();
            });
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 18,
          ),
        ),
        actions: const [
          CancelButton(),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          } else if (snapshot.hasData) {
            tasks = snapshot.data!.docs.where((doc) {
              var title = (doc['title'] as String).toLowerCase();
              return title.contains(searchTerm);
            }).toList();
            return TaskList(tasks: tasks);
          } else if (snapshot.hasError) {
            return SomethingWentWrong(message: snapshot.error.toString());
          } else {
            return const TaskList(tasks: []);
          }
        },
      ),
    );
  }
}
