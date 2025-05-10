import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';
import 'package:tflite_flutter_plus/src/bindings/types.dart' as tfl_P;

class OurClassifier extends ChangeNotifier {
  OurClassifier() {
    initialise();
  }
  bool classifying = false;
  bool initialised = false;
  bool error = false;
  List<String> labels = ["Counterfeit", "Genuine"];
  List<File> _selectedImages = [];
  List<int> changed = [];
  List<String> classification = [];
  Interpreter? interpreter;
  int width = 224;
  int height = 224;

  Future<void> initialise() async {
    if (!initialised) {
      try {
        interpreter = await Interpreter.fromAsset('models/model.tflite');
        labels = ["CounterFiet", "Genuine"];
        initialised = true;
      } catch (e) {
        debugPrint('[-] Failed to the load model: $e');
      }
    }
    initialised = true;
  }

  Future<void> classifyImages(List<File> imgListFile) async {
    classifying = true;
    notifyListeners();
    classification = [];
    debugPrint("[+] Classification started..");
    _selectedImages = imgListFile;
    if (!initialised) {
      debugPrint("[-] Not Initialized..");
      await initialise();
    }
    List<List<double>> outputTensors = [
      [0.0, 0.0]
    ];

    for (int i = 0; i < imgListFile.length; i++) {
      TensorImage normalizedImage = await _preProcessInput(i);
      debugPrint("[+] Normalized..");
      try {
        debugPrint("[+] Classifying..");
        await classify(normalizedImage, outputTensors, i);
        notifyListeners();
      } catch (e) {
        debugPrint(e as String?);
        classification = List.filled(_selectedImages.length, "Model Error");
        break;
      }
    }
    classifying = false;
  }

  Future<void> reclassifyImage({required int index}) async {
    classifying = true;
    notifyListeners();

    classification[index] = "Re-Classifiying";
    debugPrint("[+] Image Re-Classifiying");

    if (!initialised) {
      debugPrint("[-] Not Initialized");
      await initialise();
    }
    List<List<double>> outputTensors = [
      [0.0, 0.0]
    ];
    TensorImage normalizedImage = await _preProcessInput(index);
    debugPrint("[+] Normalized");

    try {
      debugPrint("[+] Classifying");

      await classify(normalizedImage, outputTensors, index);
      classification.removeAt(index + 1);
      notifyListeners();
    } catch (e) {
      debugPrint(e as String?);
      classification[index] = "Model Error";
      return;
    }
    classifying = false;
    notifyListeners();
  }

  Future<void> classify(
    TensorImage inputTensor,
    List<List<double>> outputTensors,
    int i,
  ) async {
    debugPrint("[+] Real Classification");
    interpreter!.run(
      inputTensor.buffer.asFloat32List().reshape([1, width, height, 3]),
      outputTensors,
    );

    debugPrint("[*] Done");
    var output = outputTensors[0];
    var maxIndex = output
        .indexOf(output.reduce((curr, next) => curr > next ? curr : next));

    debugPrint("${labels[maxIndex]} ${output[maxIndex] * 100} at ${i + 1}");

    classification.insert(
        i, "${labels[maxIndex]} ${output[maxIndex] * 100} at ${i + 1}");
  }

  @override
  dispose() async {
    super.dispose();
    if (interpreter != null) {
      interpreter!.close();
    }
  }

  Future<TensorImage> _preProcessInput(int i) async {
    File imageFile = File(_selectedImages[i].path);
    Uint8List imageBytes = await imageFile.readAsBytes();

    img.Image? image = img.decodeNamedImage(
      Uint8List.fromList(imageBytes),
      _selectedImages[i].path,
    );
    final inputTensor = TensorImage(tfl_P.TfLiteType.float32);

    inputTensor.loadImage(image!);
    final minLength = inputTensor.height > inputTensor.width
        ? inputTensor.width
        : inputTensor.height;
    final cropOp = ResizeWithCropOrPadOp(minLength, minLength);
    final shapeLength = interpreter!.getInputTensor(0).shape.length;
    debugPrint(shapeLength as String?);

    // Extract input tensor shape
    final resizeOp = ResizeOp(height, width, ResizeMethod.bilinear);
    final normalizeOp = NormalizeOp(127.5, 127.5);
    final imageProcessor = ImageProcessorBuilder()
        .add(cropOp)
        .add(resizeOp)
        .add(normalizeOp)
        .build();
    imageProcessor.process(inputTensor);
    return inputTensor;
  }
}
