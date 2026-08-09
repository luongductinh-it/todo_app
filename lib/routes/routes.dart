import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo_app/routes/go_route_refresh_stream.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/authentication/presentation/screens/register_screen.dart';
import '../features/authentication/presentation/screens/sign_in_screen.dart';
import '../features/task_management/presentation/screens/main_screen.dart';

part 'routes.g.dart';

enum AppRouter { main, signIn, register }

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

@riverpod
GoRouter goRouter(Ref ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return GoRouter(
    initialLocation: '/main',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = firebaseAuth.currentUser != null;
      if(isLoggedIn && (state.uri.toString() == '/signIn' || state.uri.toString() == '/register' )){
        return '/main';
      }else if(!isLoggedIn && state.uri.toString().startsWith('/main')){
        return '/signIn';
      }
      return null;
    },
    refreshListenable: GoRouteRefreshStream(firebaseAuth.authStateChanges()),
    routes: [
      GoRoute(
        path: '/main',
        name: AppRouter.main.name,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/signIn',
        name: AppRouter.signIn.name,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/register',
        name: AppRouter.register.name,
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
}
