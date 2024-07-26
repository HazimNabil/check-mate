import 'package:check_mate/constants.dart';
import 'package:check_mate/widgets/custom_text_field.dart';
import 'package:check_mate/widgets/search_body_builder.dart';
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
  Stream<QuerySnapshot<Map<String, dynamic>>>? stream;
  String searchTerm = '';

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      title: CustomTextField(
        hint: 'Search your list',
        onChanged: onChanged,
        icon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 18,
        ),
      ),
      actions: const [
        CancelButton(),
      ],
    );
  }

  void onChanged(value) {
    setState(() {
      searchTerm = value.toLowerCase();
      var taskCollection =
          FirebaseFirestore.instance.collection(kTaskCollection);
      stream = taskCollection.snapshots();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SearchBodyBuilder(
        searchTerm: searchTerm,
        stream: stream,
      ),
    );
  }
}
