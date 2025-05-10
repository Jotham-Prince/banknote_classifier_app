import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:lottie/lottie.dart';
import '../Logic/classification.dart';
import '../widgets/classificationTab.dart';
import 'package:provider/provider.dart';

class MultipleNotesPage extends StatefulWidget {
  MultipleNotesPage({
    super.key,
    required this.selectedImageFiles,
  });
  final List<File> selectedImageFiles;

  @override
  State<MultipleNotesPage> createState() => _MultipleNotesPageState();
}

class _MultipleNotesPageState extends State<MultipleNotesPage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedImages = widget.selectedImageFiles
          .map((e) => Image.file(
                e,
                fit: BoxFit.cover,
              ))
          .toList();
      CoppiedImages = [...widget.selectedImageFiles];
    });
  }

  void handleImagecrop(index) async {
    CroppedFile? tempImage = await ImageCropper().cropImage(
        cropStyle: CropStyle.rectangle,
        sourcePath: widget.selectedImageFiles[index].path);
    if (tempImage != null) {
      CoppiedImages.insert(index, File(tempImage.path));
      selectedImages.insert(
          index,
          Image.file(
            File(tempImage.path),
            fit: BoxFit.cover,
          ));
      selectedImages.removeAt(index + 1);
      CoppiedImages.removeAt(index + 1);
    }
    setState(() {});
  }

  GestureDetector renderResultAnime(int index, String location) {
    return GestureDetector(
      onDoubleTap: () {
        if (!context.read<OurClassifier>().classifying) {
          handleImagecrop(index);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ("images" != location.split("/")[1])
            ? Lottie.asset(location)
            : Image.asset(location),
      ),
    );
  }

  late List<Image> selectedImages;
  List<File> CoppiedImages = [];
  int _zoomLevel = 2;
  bool? zoomedIn = null; // keeping track of change i.e zoom_In or Zoom_Out
  //true and false respectivly

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11161A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF242A2F),
        elevation: 0.0,
        title: Center(
          child: Text(
            "Note Scan",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          InteractiveViewer(
            maxScale: 1,
            minScale: 1,
            onInteractionUpdate: (details) {
              if (zoomedIn == null) {
                if (details.scale != 1.0) {
                  if (details.scale < 1) {
                    setState(() {
                      zoomedIn = false;
                    });
                  } else {
                    setState(() {
                      zoomedIn = true;
                    });
                  }
                }
              }
              print(details.scale);
            },
            onInteractionEnd: (details) {
              if (zoomedIn != null) {
                if (zoomedIn!) {
                  if (_zoomLevel > 1) {
                    setState(() {
                      _zoomLevel = _zoomLevel - 1;
                    });
                  }
                } else {
                  if (_zoomLevel < 4) {
                    setState(() {
                      _zoomLevel = _zoomLevel + 1;
                    });
                  }
                }
              }
              zoomedIn = null;
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .025,
                  horizontal: MediaQuery.of(context).size.width * .025),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _zoomLevel,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: selectedImages.length,
                  itemBuilder: (context, index) => LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned.fill(
                              child: Expanded(
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey,
                                  ),
                                  child: GestureDetector(
                                      onDoubleTap: () {
                                        if (!context
                                            .read<OurClassifier>()
                                            .classifying) {
                                          handleImagecrop(index);
                                        }
                                      },
                                      child: selectedImages[index]),
                                ),
                              ),
                            ),
                            (context
                                    .watch<OurClassifier>()
                                    .classification
                                    .isNotEmpty)
                                ? (context
                                                .watch<OurClassifier>()
                                                .classification
                                                .length -
                                            1 >=
                                        index)
                                    ? Column(
                                        children: [
                                          Expanded(
                                            flex: 10,
                                            child: context
                                                            .watch<OurClassifier>()
                                                            .classification[
                                                        index] ==
                                                    "Re-Classifiying"
                                                ? renderResultAnime(
                                                    index, 'assets/lottie/analyse.json')
                                                : (context
                                                            .watch<
                                                                OurClassifier>()
                                                            .classification[
                                                                index]
                                                            .split(" ")[0] ==
                                                        "Genuine")
                                                    ? double.parse(context.watch<OurClassifier>().classification[index].split(" ")[1]) <
                                                            80
                                                        ? renderResultAnime(
                                                            index, 'assets/images/Error.png')
                                                        : renderResultAnime(
                                                            index,
                                                            'assets/lottie/Genuine.json')
                                                    : (context
                                                                .watch<OurClassifier>()
                                                                .classification[index]
                                                                .split(" ")[0] ==
                                                            "CounterFiet")
                                                        ? double.parse(context.watch<OurClassifier>().classification[index].split(" ")[1]) < 80
                                                            ? renderResultAnime(index, 'assets/images/Error.png')
                                                            : renderResultAnime(index, 'assets/lottie/Counterfeit.json')
                                                        : renderResultAnime(index, 'assets/images/Error.png'),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: ClassificationTab(
                                              index: index,
                                            ),
                                          ),
                                        ],
                                      )
                                    : (index ==
                                            context
                                                .watch<OurClassifier>()
                                                .classification
                                                .length)
                                        ? renderResultAnime(
                                            index, 'assets/lottie/analyse.json')
                                        : Container()
                                : Container(),
                            Positioned(
                              top: constraints.biggest.height * .025,
                              right: constraints.biggest.width * .04,
                              child: IconButton(
                                onPressed: () {
                                  if (!context
                                      .read<OurClassifier>()
                                      .classifying) {
                                    setState(() {
                                      widget.selectedImageFiles.removeAt(index);
                                      selectedImages.removeAt(index);
                                      CoppiedImages.removeAt(index);
                                      try {
                                        context
                                            .read<OurClassifier>()
                                            .classification
                                            .removeAt(index);
                                      } catch (e) {
                                        print("No classification done yet");
                                      }
                                    });
                                  }
                                },
                                icon: Icon(
                                  CupertinoIcons.xmark_circle_fill,
                                  color: Colors.yellow.shade300,
                                  size: 30.2,
                                ),
                                color: Colors.black12,
                              ),
                            )
                          ],
                        );
                      })),
            ),
          ),
          // Circular progress indicator (loading animation)
          if (context.watch<OurClassifier>().classifying)
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          Positioned(
            bottom: 3.0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: double.infinity,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton.icon(
                  onPressed: (context.read<OurClassifier>().classifying)
                      ? () {
                          print("Pressed at classifying");
                        }
                      : () {
                          context
                              .read<OurClassifier>()
                              .classifyImages(CoppiedImages);
                        },
                  icon: Icon(CupertinoIcons.arrow_2_circlepath_circle_fill),
                  label: Text(
                    "Scan All Notes",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
