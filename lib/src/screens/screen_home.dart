import 'package:duty_manager/src/screens/screen_note.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';

class ScreenHome extends StatelessWidget {
  static const String path = "/";
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      excludeHeaderSemantics: true,
      actions: [
        PopupMenuButton(
          position: PopupMenuPosition.under,
          icon: const Icon(CupertinoIcons.ellipsis),
          itemBuilder: (context) {
            return [
              const PopupMenuItem(child: Text("Hello")),
              const PopupMenuItem(child: Text("Hello")),
            ];
          },
        )
      ],
      centerTitle: false,
      title: Text("app.name".tr()),
    );
    return Scaffold(
      appBar: appBar,
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            label: "Add new task",
            child: const Icon(Icons.add_task),
          ),
          SpeedDialChild(
            label: "Add new note",
            child: const Icon(Icons.note_add),
            onTap: () => context.push(ScreenNote.path),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withAlpha(150),
                ),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withAlpha(200),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
            ),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withAlpha(150),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
