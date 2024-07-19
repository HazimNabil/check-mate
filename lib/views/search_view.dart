import 'package:check_mate/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../widgets/cancel_button.dart';

class SearchView extends StatelessWidget {
  static String route = 'search_view';

  const SearchView({super.key});

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
          onChanged: (value) {},
        ),
        actions: const [
          CancelButton(),
        ],
      ),
    );
  }
}

