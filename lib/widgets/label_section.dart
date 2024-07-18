import 'package:flutter/material.dart';

import 'label_list.dart';

class LabelSection extends StatelessWidget {
  const LabelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose a label',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          LabelList(),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
