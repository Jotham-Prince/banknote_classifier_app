import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

late List<File> user_selected_images = [];

class MyCamera extends ChangeNotifier {
  late CameraController controller;

  late List<CameraDescription> cameras;

  late List<File> user_selected_images = [];

  double zoomLevel = 0.0;
  double maxzoom = 0;
  double minzoom = 0.5;
  bool focusing = false;
  bool flashon = false;
  bool initialised = false;
  bool takingpic = false;

  Future<void> setZoom(double value) async {
    double new_value = value / 100.0 * (maxzoom - minzoom) + minzoom;
    if (new_value == minzoom) {
      new_value = value / 100.0 * 3 + minzoom;
    }
    controller.setZoomLevel(new_value);
    zoomLevel = value;
    notifyListeners();
  }

  Future<void> toggleflash() async {
    flashon = !flashon;
    if (flashon) {
      await controller.setFlashMode(FlashMode
          .always); // for some devices this means that the touch can be off
      notifyListeners();
      return;
    }
    await controller.setFlashMode(FlashMode.off);
    notifyListeners();
  }

  Future<void> snapimage() async {
    if (!takingpic) {
      debugPrint("[+] Taking A Picture");
      takingpic = true;
      notifyListeners();
      final tempimage = await controller.takePicture();
      saveToDevice(tempimage.path);
      debugPrint(tempimage.path);
      // just_taken = true;

      takingpic = false;
      notifyListeners();
      // takingpic = false;
    }
  }

  void upDateSelected({
    required bool insert,
    required File imagefile,
  }) {
    debugPrint("[*] Insetting..");
    if (insert) {
      user_selected_images.insert(0, imagefile);
      debugPrint("[+] Length of selected ${user_selected_images.length}");
      return;
    }
    user_selected_images.remove(imagefile);
  }

  Future<void> saveToDevice(String memoImageLocation) async {
    debugPrint("savingtodevice");
    final Directory directory = await getApplicationDocumentsDirectory();
    final imagename = p.basename(memoImageLocation);
    final newloc = "${directory.path}/$imagename";
    final File newimage = await File(memoImageLocation).copy(newloc);
    upDateSelected(insert: true, imagefile: newimage);
    notifyListeners();
  }

  Future<void> setFocuspoint(Offset relativeposition) async {
    Offset myoffset = Offset(
      relativeposition.dx.clamp(0.0, 1),
      relativeposition.dy.clamp(0.0, 1),
    );
    try {
      await controller.setFocusPoint(myoffset);
      focusing = true;
      notifyListeners();
      Future.delayed(
        const Duration(
          seconds: 3,
        ),
      );
      await controller.setFocusPoint(null);
      focusing = false;
      notifyListeners();
    } catch (e) {
      debugPrint(e as String?);
    }
  }

  Future<void> initialiseCamController() async {
    if (cameras.isNotEmpty) {
      controller = CameraController(cameras[0], ResolutionPreset.max);
      await controller.initialize();
      minzoom = await controller.getMinZoomLevel();
      maxzoom = await controller.getMinZoomLevel();
      await controller.setFlashMode(FlashMode.off);
      initialised = true;
      notifyListeners();
    } else {
      // Handle scenario when no cameras are available
      await getAvailableCameras();

      await initialiseCamController();
    }
  }

  Future<void> getAvailableCameras() async {
    cameras = await availableCameras();
    notifyListeners();
  }

  @override
  void dispose() {
    debugPrint("disposing camera");
    controller.dispose();
    initialised = false;
    notifyListeners();
    super.dispose();
  }
}
