import 'package:go_router/go_router.dart';
import '../pages/home/home_page.dart';
import '../pages/main/main_screen.dart';
import '../pages/splash/splash_page.dart';
import 'route_path.dart';

final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: RouterPath.splash, /// 상수이기에 routes_path.dart 생성
        name: '/splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RouterPath.main,
        name: '/main',
        builder: (context, state) => const MainScreen(),
      ),
    ],

    /// TODO : initialLocation : 처음 위치 지정
    initialLocation: '/splash'
);