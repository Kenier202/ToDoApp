import 'package:go_router/go_router.dart';
import 'package:todo_app/pages/toDo_barrel.dart';

final routes = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      name: HomeView.name,
      path: "/",
      builder: (context, state) => HomeView(),
    ),
  ],
);
