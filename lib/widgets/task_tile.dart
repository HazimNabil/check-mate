import 'package:check_mate/constants.dart';
import 'package:check_mate/widgets/label_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              icon: Icons.edit,
              backgroundColor: kPrimaryColor,
              foregroundColor: kBackgroundColor,
            ),
            SlidableAction(
              onPressed: (context) {},
              icon: Icons.delete,
              backgroundColor: Colors.red,
              foregroundColor: kBackgroundColor,
            ),
          ],
        ),
        child: ListTile(
          tileColor: Colors.blue,
          contentPadding: const EdgeInsets.symmetric(horizontal: 2),
          horizontalTitleGap: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.check_box_outline_blank,
              size: 21,
            ),
            onPressed: () {},
          ),
          title: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text(
              "Write code",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          trailing: const LabelItem(
            label: 'Finance',
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
