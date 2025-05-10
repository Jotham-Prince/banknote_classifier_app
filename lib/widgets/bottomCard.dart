import '../Logic/imagePicker.dart';
import 'package:flutter/cupertino.dart';
import 'customCard.dart';
import 'dart:io';

class BottomCard extends StatelessWidget {
  const BottomCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.5, // Set height to half the screen height
      width: screenWidth, // Set width to the full screen width
      decoration: BoxDecoration(
        color: const Color(0xFF242A2F),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 8.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: const Color(0xFF6D7780),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Image.asset('assets/images/file_emoji.png'),
              ),
              Spacer(),
              Expanded(
                child: Image.asset('assets/images/camera_emoji.png'),
              ),
              Spacer(),
              Expanded(
                child: Image.asset('assets/images/bank_emoji.png'),
              ),
              Spacer(),
              Expanded(
                child: Image.asset('assets/images/bank_emoji.png'),
              ),
              Spacer(),
              Expanded(
                child: Image.asset('assets/images/complete_emoji.png'),
              ),
            ],
          ),
          CustomCard(
            imagePath: 'assets/images/camera_icon.png',
            text: 'Camera',
            subtitle: 'Open Camera and take money snaps',
            icon: CupertinoIcons.arrow_right_circle_fill,
            onTap: () {
              Navigator.pushNamed(context, "/camera");
            },
          ),
          CustomCard(
            imagePath: 'assets/images/folder_icon.png',
            text: 'Browser',
            subtitle: 'Scan saved bank notes on device',
            icon: CupertinoIcons.arrow_right_circle_fill,
            onTap: () async {
              List<File> selected = await Myimagepicker.chooseimages();
              if (selected.isNotEmpty) {
                Navigator.pushNamed(
                  context,
                  "/browser",
                  arguments: {
                    "selectedImageFiles": selected,
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
