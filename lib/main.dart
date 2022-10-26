import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:provider/provider.dart';
import 'package:fooderlich/screens/screens.dart';

import 'fooderlich_theme.dart';
import 'home.dart';
import 'package:fooderlich/navigation/app_router.dart';

void main() async {
  final _appStateManager = AppStateManager();
  await _appStateManager.initializeApp;
  ChangeNotifierProvider(
    create: (context) => _appStateManager,
  );
  runApp(Fooderlich(appStateManager: AppStateManager));
}

class Fooderlich extends StatefulWidget {
  const Fooderlich({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();
    return MaterialApp(title: 'Fooderlich', theme: theme, home: const Home());
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
