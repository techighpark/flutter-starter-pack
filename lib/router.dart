import 'package:dev_app_1/features/authentication/views/sign_in_form_view.dart';
import 'package:dev_app_1/features/authentication/views/sign_up_form_view.dart';
import 'package:dev_app_1/features/main_navigation/views/custom_navigation_view.dart';
import 'package:dev_app_1/features/main_navigation/views/custom_navigation_view.dart';
import 'package:dev_app_1/features/main_navigation/views/custom_navigation_view.dart';
import 'package:dev_app_1/features/main_navigation/views/main_navigation_view.dart';
import 'package:dev_app_1/features/main_navigation/views/main_navigation_view.dart';
import 'package:dev_app_1/features/main_navigation/views/main_navigation_view.dart';
import 'package:dev_app_1/features/main_navigation/views/my_cupertino_tab_bar_view.dart';
import 'package:dev_app_1/features/main_navigation/views/my_cupertino_tab_bar_view.dart';
import 'package:dev_app_1/features/main_navigation/views/my_cupertino_tab_bar_view.dart';
import 'package:dev_app_1/features/onboarding/views/my_tab_bar_view.dart';
import 'package:dev_app_1/features/onboarding/views/my_tab_bar_view.dart';
import 'package:dev_app_1/features/onboarding/views/my_tab_bar_view.dart';
import 'package:dev_app_1/features/onboarding/views/my_single_child_scroll_view.dart';
import 'package:dev_app_1/features/widget_navigation/widget_navigation.dart';
import 'package:dev_app_1/features/widget_navigation/widget_navigation.dart';
import 'package:dev_app_1/features/widget_navigation/widget_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/widgetnav',
    routes: [
      GoRoute(
        path: SignInFormView.routeUrl,
        name: SignInFormView.routeName,
        builder: (context, state) => const SignInFormView(),
      ),
      GoRoute(
        path: SignUpFormView.routeUrl,
        name: SignUpFormView.routeName,
        builder: (context, state) => const SignUpFormView(),
      ),
      GoRoute(
        path: WidgetNavigation.routeUrl,
        name: WidgetNavigation.routeName,
        builder: (context, state) {
          return const WidgetNavigation();
        },
      ),
      GoRoute(
        path: MySingleChildScrollView.routeUrl,
        name: MySingleChildScrollView.routeName,
        builder: (context, state) {
          final email = state.queryParams['email'] ?? 'no email';
          return MySingleChildScrollView(email: email);
        },
      ),
      GoRoute(
        // path: "/:tab(home|discover|inbox|profile)",
        path: MainNavigationView.routeUrl,
        name: MainNavigationView.routeName,
        builder: (context, state) {
          // final tab = state.params["tab"]!;
          return const MainNavigationView();
        },
      ),
      GoRoute(
        path: MyCupertinoTabBarView.routeUrl,
        name: MyCupertinoTabBarView.routeName,
        builder: (context, state) {
          return const MyCupertinoTabBarView();
        },
      ),
      GoRoute(
        path: CustomNavigationView.routeUrl,
        name: CustomNavigationView.routeName,
        builder: (context, state) {
          return const CustomNavigationView();
        },
      ),
    ],
  ),
);
