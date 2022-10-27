import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:provider/provider.dart';

import 'fooderlich_theme.dart';
import 'home.dart';
import 'package:fooderlich/navigation/app_router.dart';

void main() async {
  final _appStateManager = AppStateManager();
  _appStateManager.initializeApp;
  ChangeNotifierProvider(
    create: (context) => _appStateManager,
  );

  runApp(Fooderlich(appStateManager: _appStateManager));
}

class Fooderlich extends StatefulWidget {
  final AppStateManager appStateManager;

  const Fooderlich({super.key, required this.appStateManager});

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();
    return MaterialApp(title: 'Fooderlich', theme: theme, home: const Home());
  }

  @override
  State<StatefulWidget> createState() => FooderlichState();
}

class FooderlichState extends State<Fooderlich> {
  final _appStateManager = AppStateManager();
  final _groceryManager = GroceryManager();
  final _profileManager = ProfileManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
        appStateManager: _appStateManager,
        groceryManager: _groceryManager,
        profileManager: _profileManager);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _groceryManager),
        ChangeNotifierProvider(create: (context) => _profileManager),
        ChangeNotifierProvider(create: (context) => widget.appStateManager)
      ],
      child:
          Consumer<ProfileManager>(builder: (context, profileManager, child) {
        ThemeData theme;
        if (profileManager.darkMode) {
          theme = FooderlichTheme.dark();
        } else {
          theme = FooderlichTheme.light();
        }

        // TODO: Replace with Router
        return MaterialApp(
          theme: theme,
          title: 'Fooderlich',
          home: Router(
            routerDelegate: _appRouter,
            // TODO: Add backButtonDispatcher
          ),
        );
      }),
    );
  }
}
