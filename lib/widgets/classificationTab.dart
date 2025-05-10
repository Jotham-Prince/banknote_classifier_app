import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_detection/Logic/classification.dart';
import 'package:provider/provider.dart';

class ClassificationTab extends StatelessWidget {
  const ClassificationTab({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        color: Colors.black54,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 10,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return Center(
                  child: Text(
                    (context
                                .watch<OurClassifier>()
                                .classification[index]
                                .length ==
                            11)
                        ? "Classification Failure"
                        : (context
                                    .watch<OurClassifier>()
                                    .classification[index] ==
                                "Re-Classifiying")
                            ? "Retrying"
                            : double.parse(context
                                        .watch<OurClassifier>()
                                        .classification[index]
                                        .split(" ")[1]) >
                                    80
                                ? "${context.watch<OurClassifier>().classification[index].split(" ")[1].substring(0, 5)}% Confidence"
                                : "Recognition Failure",
                    style: GoogleFonts.openSans(
                      color: Colors.amber,
                      // fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                      decorationColor: Colors.amber,
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            flex: 3,
            child: FittedBox(
              fit: BoxFit.contain,
              child: IconButton(
                onPressed: (context.read<OurClassifier>().classifying)
                    ? () {
                        print("Pressed during classifying");
                      }
                    : () {
                        context
                            .read<OurClassifier>()
                            .reclassifyImage(index: index);
                      },
                icon: const Icon(
                  CupertinoIcons.arrow_clockwise_circle_fill,
                  color: Colors.amber,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
