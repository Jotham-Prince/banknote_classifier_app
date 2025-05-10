import 'package:flutter/cupertino.dart';

class MyChoiceWidget extends StatelessWidget {
  final String choice;

  const MyChoiceWidget({super.key, required this.choice});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          (choice == "camera")
              ? CupertinoIcons.camera_fill
              : CupertinoIcons.folder_fill_badge_person_crop,
          size: 100,
        ),
        Text((choice == "camera") ? "Take Image" : "Browse Storage"),
      ],
    );
  }
}
