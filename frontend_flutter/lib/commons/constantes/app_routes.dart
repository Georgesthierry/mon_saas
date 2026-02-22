import 'package:go_router/go_router.dart';
import 'package:yenlei_flutter/src/about/about_page.dart';
import 'package:yenlei_flutter/src/home/home_screen.dart';
import 'package:yenlei_flutter/src/project/project_page.dart';

class Routes{

  static const  acceuil ='/';
  static const propos = '/apropos';
  static const projets = '/projets';
  static const services = '/services';
  static const contact = '/contact';
}

class AppRoute{
  
  static final router = GoRouter(
  routes: [
    GoRoute(path: Routes.acceuil,
      pageBuilder: (context,state)=> NoTransitionPage(
          child: HomeScreen())
    ),
    GoRoute(path: Routes.propos,
        pageBuilder: (context,state)=> NoTransitionPage(
            child: AboutPage())),
    GoRoute(path: Routes.projets,
        pageBuilder: (context,state)=> NoTransitionPage(
            child: ProjectPage())),
    GoRoute(path: Routes.services,
        pageBuilder: (context,state)=> NoTransitionPage(
            child: HomeScreen())),
    GoRoute(path: Routes.contact,
        pageBuilder: (context,state)=> NoTransitionPage(
            child: HomeScreen())),
  ]);
}