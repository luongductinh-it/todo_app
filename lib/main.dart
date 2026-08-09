import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_todo_app/firebase_options.dart';
import 'package:firebase_todo_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.green),
        appBarTheme: AppBarTheme().copyWith(
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
        ),
      ),
    );
  }
}
