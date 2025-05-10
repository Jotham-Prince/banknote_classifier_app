import 'dart:io';
import 'package:flutter/material.dart';
import '../Screens/errorPage.dart';
import '../Logic/classification.dart';
import 'cameraDetails.dart';
import '../Screens/cameraPreview.dart';
import '../Screens/helpPage.dart';
import '../Screens/multipleNotesPage.dart';
import '../Screens/homePage.dart';
import 'package:provider/provider.dart';
import '../Screens/splashScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/splash":
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case "/":
        return MaterialPageRoute(builder: (_) => MyHomePage(title: 'Home'));
      case "/camera":
        return MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) {
                  MyCamera m = MyCamera();
                  m.cameras = [];
                  return m;
                },
              )
            ],
            child: const Mycamerapreview(),
          ),
        );
      case "/browsers":
      case "/browser":
        return MaterialPageRoute(builder: (_) {
          try {
            Map<String, List<File>>? argss = args as Map<String, List<File>>;
            return ChangeNotifierProvider(
              create: (context) => OurClassifier(),
              child: MultipleNotesPage(
                selectedImageFiles: argss.values.first,
              ),
            );
          } catch (e) {
            debugPrint(e as String?);
            if (args is List<File>) {
              return ChangeNotifierProvider(
                create: (context) => OurClassifier(),
                child: MultipleNotesPage(
                  selectedImageFiles: args,
                ),
              );
            }
          }
          return const Errorpage();
        });

      case "/About the app":
        return MaterialPageRoute(builder: (_) => const AppBrief());
      default:
        return MaterialPageRoute(
          builder: (_) => const Errorpage(),
        );
    }
  }
}
