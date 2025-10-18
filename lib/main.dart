

import 'core/utils/app_services/local_services/cache_helper.dart';
import 'core/utils/app_services/remote_services/service_locator.dart';
import 'core/utils/bloc_observer.dart';
import 'main_importants.dart';
import 'my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  debugPrint("main");
  String? token = await CacheTokenManger.getUserToken();
  debugPrint("Retrieved token: $token");
  await CacheHelper.init();
  setup();
  Bloc.observer = SimpleBlocObserver();
  runApp(  const MyApp(),);
}

