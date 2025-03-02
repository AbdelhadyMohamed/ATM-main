import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hypelify/models/atm_model.dart';
import '../Modules/ATM/atm_screen.dart';
import '../Modules/AtmDetails/atm_details_screen.dart';
import '../Modules/Auth/Visits/visits_screen.dart';
import '../Modules/home/home_screen.dart';
import '../Modules/Auth/Login/login_screen.dart';
import '../Modules/Splash/splash_screen.dart';

BuildContext? get currentContext_ =>
    GoRouterConfig.router.routerDelegate.navigatorKey.currentContext;

class GoRouterConfig {
  static void popUntilPath(String pattern) {
    final router = GoRouter.of(currentContext_!);
    while (router.location.contains(pattern)) {
      if (!router.canPop()) return;
      router.pop();
    }
  }

  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: SplashScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const SplashScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: "/${LoginScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const LoginScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: HomeScreen.routeName,
        path: "/${HomeScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const HomeScreen(),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            name: VisitsScreen.routeName,
            path: VisitsScreen.routeName,
            pageBuilder: (_, GoRouterState state) {
              return getCustomTransitionPage(
                state: state,
                child: const VisitsScreen(),
              );
            },
            routes:  <RouteBase>[
              GoRoute(
                name: AtmScreen.routeName,
                path: AtmScreen.routeName,
                pageBuilder: (_, GoRouterState state) {
                  return getCustomTransitionPage(
                    state: state,
                    child:  AtmScreen(id:  state.queryParameters["id"] ?? "",
                    visit: state.queryParameters["visit"]??"",
                    code: state.queryParameters["code"]??"",
                      year: state.queryParameters["year"]??"",
                      month: state.queryParameters["month"]??"",                    ),
                  );
                },
                routes: const <RouteBase>[],
              ),
              GoRoute(
                name: AtmDetailsScreen.routeName,
                path: AtmDetailsScreen.routeName,
                pageBuilder: (_, GoRouterState state) {
                  return getCustomTransitionPage(
                    state: state,
                    child:  AtmDetailsScreen(atm:  state.extra as AtmModel,
                        visitId: state.queryParameters["visitId"]??"",
                        code: state.queryParameters["code"]??"",
                        visit: state.queryParameters["visit"]??"",
                        year: state.queryParameters["year"]??"",
                        month: state.queryParameters["month"]??"",

                    ),
                  );
                },
                routes: const <RouteBase>[],
              ),
            ],
          ),

        ],
      ),
    ],
    // redirect: (BuildContext context, GoRouterState state) {
    //   if(!SharedPref.isLogin()) return LoginScreen.routeName;
    //   if(state.matchedLocation == LoginScreen.routeName && SharedPref.isLogin()) return "/${HomeScreen.routeName}";
    //
    //   if(state.matchedLocation == OtpScreen.routeName && state.extra == null){
    //     return ForgotPasswordScreen.routeName;
    //   }
    // },
  );

  static CustomTransitionPage getCustomTransitionPage(
      {required GoRouterState state, required Widget child}) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}
