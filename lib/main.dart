import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:note_detection/Logic/routeLogic.dart';

late final List<CameraDescription> cameras;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note Scan',
      theme: ThemeData(
        useMaterial3: true,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      //set the initial route to the splash screen
      initialRoute: "/splash",
    );
  }
}
