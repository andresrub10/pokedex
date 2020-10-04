import 'package:Pokedex/misc/service_locator.dart';
import 'package:flutter/widgets.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locator.registerDependencies();
  runApp(App());
}
