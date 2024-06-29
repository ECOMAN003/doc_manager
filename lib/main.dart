import 'package:doc_manager/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:doc_manager/firebase_options.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'package:url_strategy/url_strategy.dart';


/// Entry point of Flutter App
Future<void> main() async {
  // Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetX Local Storage

  // Remove # sign from url
  setPathUrlStrategy();

  // Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  .then((value) => Get.put(AuthenticationRepository()));
//.then((_) => Get.put(AuthenticationRepository()));
  // Main App Starts here...
  runApp(const App());
}
